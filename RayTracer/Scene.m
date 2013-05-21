//
//  Scene.m
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import "Scene.h"
#import "Sphere.h"

@implementation Scene

- (id) init
{
  if ( self = [super init] )
  {
    objects = [[NSMutableSet alloc] init];
    RTVector v = { 2.0, 2.0, 2.0 };
    Sphere *sp = [[Sphere alloc] initWithCenter: &v Radius: 1.0 ];
    [objects addObject:sp];
  }
  return self;
}

@end
