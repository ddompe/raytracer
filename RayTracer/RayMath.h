//
//  RayMath.h
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#ifndef RayTracer_RayMath_h
#define RayTracer_RayMath_h

typedef struct {
  float x;
  float y;
  float z;
} RTVector;

static inline void vector_add(RTVector *a,
                       RTVector *b,
                       RTVector *result)
{
  result->x = a->x + b->x;
  result->y = a->y + b->y;
  result->z = a->y + b->z;
}

static inline void vector_rest(RTVector *a,
                        RTVector *b,
                        RTVector *result)
{
  result->x = a->x - b->x;
  result->y = a->y - b->y;
  result->z = a->z - b->z;
}

static inline float vector_dotProduct(RTVector *a,
                               RTVector *b)
{
  return (a->x * b->x) + (a->y * b->y) + (a->z * b->z);
}

#endif
