//
//  Sphere.h
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VisibleObject.h"

@interface Sphere : NSObject <VisibleObject> {
  RTVector center;
  float radius;
}

- (id) initWithCenter: (RTVector *)_center
               Radius: (float)_radius;
@end
