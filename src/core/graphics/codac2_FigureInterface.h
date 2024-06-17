/** 
 *  \file codac2_FigureInterface.h
 * ----------------------------------------------------------------------------
 *  \date       2024
 *  \author     Simon Rohou
 *  \copyright  Copyright 2024 Codac Team
 *  \license    GNU Lesser General Public License (LGPL)
 */

#pragma once

#include <vector>
#include <string>
#include "codac2_Vector.h"
#include "codac2_IntervalVector.h"
#include "codac2_StyleProperties.h"

namespace codac2
{
  class FigureInterface
  {
    public:

      // Geometric shapes
      virtual void draw_point(const Vector& c, const StyleProperties& s = StyleProperties()) = 0;
      virtual void draw_box(const IntervalVector& x, const StyleProperties& s = StyleProperties()) = 0;
      virtual void draw_circle(const Vector& c, double r, const StyleProperties& s = StyleProperties()) = 0;
      virtual void draw_polyline(const std::vector<Vector>& x, float tip_length, const StyleProperties& s = StyleProperties()) = 0;
      virtual void draw_pie(const Vector& c, const Interval& r, const Interval& theta, const StyleProperties& s = StyleProperties()) = 0;

      // Robots
      virtual void draw_tank(const Vector& x, float size, const StyleProperties& s = StyleProperties()) = 0;
      virtual void draw_AUV(const Vector& x, float size, const StyleProperties& s = StyleProperties()) = 0;
  };
}