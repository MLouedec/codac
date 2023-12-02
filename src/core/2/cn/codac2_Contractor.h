#ifndef __CODAC2_CONTRACTOR__
#define __CODAC2_CONTRACTOR__

#include <memory>
#include "codac2_IntervalVector.h"
#include "codac2_ContractorNode.h"

namespace codac2
{

  #define make_available_in_cn() \
    template<typename... T> \
    std::shared_ptr<ContractorNodeBase> operator()(T&... a) \
    { \
      return std::make_shared<ContractorNode<std::remove_reference<decltype(*this)>::type,T...>>(*this, a...); \
    } \

  #define make_available_in_cn__templated(template_args) \
    template<typename... T> \
    std::shared_ptr<ContractorNodeBase> operator()(T&... a) \
    { \
      return std::make_shared<ContractorNode<template_args,T...>>(*this, a...); \
    } \

  class Contractor
  {
    public:
      
      virtual ~Contractor() = default;
  };

  template<int N>
  class ContractorOnBox : public Contractor
  {
    public:

      virtual void contract(IntervalVector_<N>& x) = 0;
  };

  class Contractor1 : public Contractor
  {
    public:

      Contractor1();
      void contract(IntervalVector_<3>& x);
      
      make_available_in_cn()
  };


  class Contractor2 : public Contractor
  {
    public:

      Contractor2();
      void contract(IntervalVector_<2>& x, IntervalVector_<3>& y);

      make_available_in_cn()
  };

}

#endif