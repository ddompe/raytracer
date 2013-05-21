//
//  RenderEngine.h
//  RayTracer
//
//  Created by Diego Dompe on 5/20/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RayMath.h"
#import "Scene.h"

@interface RenderEngine : NSObject

- (NSBitmapImageRep *) rayTraceScene: (Scene *)scene
                           withEyeAt: (RTVector *)eye
                   andViewPortOrigin: (RTVector *)origin
                                size: (NSSize) size;

@end
