//
//  VisibleObject.h
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RayMath.h"

@protocol VisibleObject <NSObject>
//NSUInteger _bgColor[3];

- (bool) doesItersectsRayWithOriginAt: (RTVector *)origin
                     andTerminationAt: (RTVector *)end
                        storeResultAt: (float *)result;

@end
