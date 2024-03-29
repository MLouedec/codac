/** 
 *  \file
 *  CtcUnion class
 * ----------------------------------------------------------------------------
 *  \date       2024
 *  \author     Simon Rohou
 *  \copyright  Copyright 2024 Codac Team
 *  \license    This program is distributed under the terms of
 *              the GNU Lesser General Public License (LGPL).
 */

#ifndef __CODAC2_CTCUNION__
#define __CODAC2_CTCUNION__

#include "codac2_CtcWrapper.h"
#include "codac2_CollectionCtc.h"

namespace codac2
{
  class CtcUnion : public CollectionCtc, public Ctc_<IntervalVector>
  {
    public:

      template<typename... C>
      CtcUnion(const C&... c) : CollectionCtc(c...)
      { }

      void contract(IntervalVector& x) const
      {
        auto result = x;
        result.set_empty();

        for(auto& ci : _v_ctc_ptrs)
        {
          auto saved_x = x;
          ci->contract(saved_x);
          result |= saved_x;
        }

        x = result;
      }

      template<typename C, // C should be some Ctc class
        typename = typename std::enable_if<std::is_base_of<Ctc,C>::value>::type>
      CtcUnion& operator|=(const C& c)
      {
        add_shared_ptr(std::make_shared<C>(c));
        return *this;
      }
  };

  template<typename C2, // C2 should be some Ctc class
    typename = typename std::enable_if<std::is_base_of<Ctc,C2>::value>::type>
  inline CtcUnion operator|(const CtcUnion& c1, const C2& c2)
  {
    return CtcUnion(c1,c2);
  }
}

#endif