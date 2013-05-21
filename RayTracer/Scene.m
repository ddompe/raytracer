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

@synthesize objects;
@synthesize lightSources;

- (NSUInteger *)bgColor
{
  return _bgColor;
}

- (void)setBgColor: (NSUInteger *) bgcolor;
{
  _bgColor[0] = bgcolor[0];
  _bgColor[1] = bgcolor[1];
  _bgColor[2] = bgcolor[2];
}

- (id) init
{
  if ( self = [super init] )
  {
    objects = [[NSMutableSet alloc] init];

    _bgColor[0] = 0;
    _bgColor[1] = 0;
    _bgColor[2] = 0;
    
    RTVector v = { 2.0, 2.0, 2.0 };
    Sphere *sp = [[Sphere alloc] initWithCenter: &v Radius: 1.0 ];
    [objects addObject:sp];
  }
  return self;
}

@end
