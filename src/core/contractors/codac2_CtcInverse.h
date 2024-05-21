/** 
 *  \file
 *  CtcInverse class
 * ----------------------------------------------------------------------------
 *  \date       2024
 *  \author     Simon Rohou
 *  \copyright  Copyright 2024 Codac Team
 *  \license    This program is distributed under the terms of
 *              the GNU Lesser General Public License (LGPL).
 */

#pragma once

#include <map>
#include "codac2_AnalyticFunction.h"
#include "codac2_Ctc.h"
#include "codac2_CtcWrapper.h"
#include "codac2_Collection.h"

namespace codac2
{
  template<typename Y>
  class CtcInverse : virtual public Ctc
  {
    public:

      template<typename C>
      CtcInverse(const AnalyticFunction<typename Wrapper<Y>::Domain>& f, const C& ctc_y, bool with_centered_form = true, bool is_not_in = false)
        : _f(f), _ctc_y(ctc_y), _with_centered_form(with_centered_form), _is_not_in(is_not_in)
      { }

      CtcInverse(const AnalyticFunction<typename Wrapper<Y>::Domain>& f, const Y& y, bool with_centered_form = true, bool is_not_in = false)
        : CtcInverse(f, CtcWrapper_<Y>(y), with_centered_form, is_not_in)
      { }

      virtual std::shared_ptr<Ctc> copy() const
      {
        return std::make_shared<CtcInverse<Y>>(*this);
      }

      template<typename... X>
      void contract(X&... x) const
      {
        contract(_with_centered_form, x...);
      }

      template<typename... X>
      void contract(bool with_centered_form, X&... x) const
      {
        ValuesMap v;
        // Setting user values into a map before the tree evaluation
        _f.fill_from_args(v, x...);

        // Forward/backward algorithm:

          // [1/4] Forward evaluation
          _f.expr()->fwd_eval(v, _f.args().total_size());
          auto& val_expr = _f.expr()->value(v);

          if(_is_not_in && !val_expr.def_domain)
            return; // <-- iota: if the input x is outside the definition 
          // domain of one of the involved expressions, or their combinations,
          // then the inner contraction is disabled.
          
          // [2/4] Performing top contraction (from the root of the tree) with
          // the contractor expressing the output domain Y.
          // The underlying constraint is:  f(x) \in [y]
          _ctc_y.front().contract(val_expr.a);

          // [3/4 - optional]
          // The contraction can be significantly improved using a centered form
          // expression (enabled by default). This step must be processed before the
          // backward part of the FwdBwd algorithm (the .m, .a values must not be
          // changed before the centered evaluation).
          if(with_centered_form && val_expr.def_domain)
          {
            using X0 = std::tuple_element_t<0, std::tuple<X...>>;

            if(sizeof...(X) == 1 && std::is_same_v<X0,IntervalVector>)
            {
              X0& x_ = std::get<0>(std::tie(x...));
              X0 x_mid = X0(x_.mid());

              assert(val_expr.a.size() == val_expr.m.size());
              IntervalVector fm(val_expr.a - val_expr.m);

              if constexpr(std::is_same_v<Y,IntervalMatrix>)
              {
                std::cout << "CtcInverse: matrices expressions not (yet) supported with centered form" << std::endl;
              }

              else
              {

                IntervalVector p = x_ - x_mid;
                MulOp::bwd(fm, val_expr.da, p);
                x_ &= p + x_mid;
              }
            }

            else
            {
              std::cout << "CtcInverse: not (yet) implemented for multi-nonvector-arguments" << std::endl;
            }
          }
          
        // [4/4] Backward evaluation
        _f.expr()->bwd_eval(v);
        _f.intersect_from_args(v, x...); // updating input values
      }

    protected:

      const AnalyticFunction<typename Wrapper<Y>::Domain> _f;
      const Collection<Ctc_<Y>> _ctc_y;
      bool _with_centered_form;
      bool _is_not_in = false;
  };

  template<typename Y,typename X=IntervalVector>
  class CtcInverse_ : public Ctc_<X>, public CtcInverse<Y>
  {
    public:

      CtcInverse_(const AnalyticFunction<typename Wrapper<Y>::Domain>& f, const Y& y, bool with_centered_form = true, bool is_not_in = false)
        : Ctc_<X>(f.args()[0]->size() /* f must have only one arg, see following assert */),
          CtcInverse<Y>(f,y,with_centered_form,is_not_in)
      {
        assert(f.args().size() == 1);
      }

      CtcInverse_(const AnalyticFunction<typename Wrapper<Y>::Domain>& f, const Ctc_<Y>& ctc_y, bool with_centered_form = true, bool is_not_in = false)
        : CtcInverse<Y>(f,ctc_y,with_centered_form,is_not_in)
      {
        assert(f.args().size() == 1);
      }

      virtual std::shared_ptr<Ctc> copy() const
      {
        return std::make_shared<CtcInverse_<Y,X>>(*this);
      }

      void contract(X& x) const
      {
        CtcInverse<Y>::contract(x);
      }
  };
}