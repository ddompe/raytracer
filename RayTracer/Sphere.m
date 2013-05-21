//
//  Sphere.m
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import "Sphere.h"

@implementation Sphere

- (id) initWithCenter: (RTVector *)_center
               Radius: (float)_radius
{
  if ( self = [super init] )
  {
    center = *_center;
    radius = _radius;
  }
  
  return self;
}

/* Equations from: 
 - http://www.ccs.neu.edu/home/fell/CSU540/programs/RayTracingFormulas.htm
 - http://wiki.cgsociety.org/index.php/Ray_Sphere_Intersection
 */
- (bool) doesItersectsRayWithOriginAt: (RTVector *)origin
                     andTerminationAt: (RTVector *)end
                        storeResultAt: (float)result;
{
  RTVector direction,tmp;
  float a, b, c;
  float discriminant;
  
  vector_rest(end, origin, &direction);
  
  a = vector_dotProduct(&direction, &direction);
  vector_rest(origin,&center,&tmp);
  b = 2 * vector_dotProduct(&direction, &tmp);
  c = vector_dotProduct(&tmp,&tmp) - radius * radius;
  discriminant = pow(b,2.0) - 4 * a * c;
  
  if (discriminant < 0)
    return false;
  else
  {
    // compute q as described above
    float distSqrt = sqrtf(discriminant);
    float q;
    if (b < 0)
      q = (-b - distSqrt)/2.0;
    else
      q = (-b + distSqrt)/2.0;
    
    // compute t0 and t1
    float t0 = q / a;
    float t1 = c / q;
    
    // make sure t0 is smaller than t1
    if (t0 > t1)
    {
      // if t0 is bigger than t1 swap them around
      float temp = t0;
      t0 = t1;
      t1 = temp;
    }
    
    // if t1 is less than zero, the object is in the ray's negative direction
    // and consequently the ray misses the sphere
    if (t1 < 0)
      return false;
    
    // if t0 is less than zero, the intersection point is at t1
    if (t0 < 0)
    {
      result = t1;
      return true;
    }
    // else the intersection point is at t0
    else
    {
      result = t0;
      return true;
    }
  }
  
  return TRUE;
}

@end
