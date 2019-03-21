/* ============================================================================
 *  tubex-lib - DataLoaderLissajous class
 * ============================================================================
 *  Copyright : Copyright 2017 Simon Rohou
 *  License   : This program is distributed under the terms of
 *              the GNU Lesser General Public License (LGPL).
 *
 *  Author(s) : Simon Rohou
 *  Bug fixes : -
 *  Created   : 2018
 * ---------------------------------------------------------------------------- */

#include <time.h>
#include "tubex_DataLoaderLissajous.h"
#include "tubex_Function.h"
#include "tubex_Tube.h"

using namespace std;
using namespace ibex;

namespace tubex
{
  DataLoaderLissajous::DataLoaderLissajous()
    : DataLoader()
  {

  }

  void DataLoaderLissajous::load_data(TubeVector *&x, TrajectoryVector *&truth, float timestep, const Interval& domain)
  {
    assert(DynamicalItem::valid_domain(domain) || domain == Interval::ALL_REALS);

    clock_t t_start = clock();
    cout << "Loading data... " << flush;

    Interval t_domain = domain;
    if(t_domain.is_unbounded())
      t_domain = Interval(0., 6.);

    Function f_lissajous("(120.*2.*cos(t) - 240. ; \
                           120.*sin(2.*t) ; \
                           -120.*2.*sin(t) ; \
                           240.*cos(2.*t))");
    truth = new TrajectoryVector(t_domain, f_lissajous);

    x = new TubeVector(t_domain, 0.01, f_lissajous);
    (*x)[2].inflate(0.1);
    (*x)[3].inflate(0.1);
    (*x)[0] = (*x)[2].primitive();
    (*x)[1] = (*x)[3].primitive();

    (*x)[0].inflate(100.);
    (*x)[1].inflate(100.);

    printf(" %.2fs\n", (double)(clock() - t_start)/CLOCKS_PER_SEC);
  }

  vector<Beacon> DataLoaderLissajous::get_beacons(const IntervalVector& map_box) const
  {
    assert(map_box.size() == 2);

    srand(time(NULL));
    vector<Beacon> v_beacons;
    int nb_random_beacons = 100;
    for(int i = 0 ; i < nb_random_beacons ; i++)
    {
      double x = map_box[0].lb() + static_cast<float>(rand()) / static_cast<float>(RAND_MAX) * map_box[0].diam();
      double y = map_box[1].lb() + static_cast<float>(rand()) / static_cast<float>(RAND_MAX) * map_box[1].diam();
      v_beacons.push_back(Beacon(x, y));
    }

    return v_beacons;
  }
  
  vector<IntervalVector> DataLoaderLissajous::get_observations(const TrajectoryVector& x, const vector<Beacon>& map) const
  {
    assert(x.size() >= 2);

    float timestep = 50.;
    float max_range = 50.;
    vector<IntervalVector> v_obs;

    for(double t = x.domain().lb() ; t < x.domain().ub() ; t+= x.domain().diam() / timestep)
    {
      for(int i = 0 ; i < map.size() ; i++)
      {
        float r = std::sqrt(std::pow(x[0](t) - map[i].pos()[0], 2) + std::pow(x[1](t) - map[i].pos()[1], 2));
        if(r < max_range) // if the beacon is seen by the robot
        {
          IntervalVector obs(3);
          obs[0] = t;
          obs[1] = r + Interval(-0.1,0.1);
          obs[2] = M_PI + std::atan2(x[1](t) - map[i].pos()[1], x[0](t) - map[i].pos()[0]) + Interval(-0.1,0.1);
          v_obs.push_back(obs);
        }
      }
    }
    
    return v_obs;
  }
}