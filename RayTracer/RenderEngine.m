//
//  RenderEngine.m
//  RayTracer
//
//  Created by Diego Dompe on 5/20/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import "RenderEngine.h"

@implementation RenderEngine

- (NSBitmapImageRep *) rayTraceScene: (Scene *)scene
                           withEyeAt: (RTVector *)eye
                   andViewPortOrigin: (RTVector *)origin
                                size: (NSSize) size;
{
  NSBitmapImageRep *image;
  
  image = [[NSBitmapImageRep alloc]
           initWithBitmapDataPlanes: NULL
           pixelsWide:size.width
           pixelsHigh:size.height
           bitsPerSample:8
           samplesPerPixel:3
           hasAlpha:FALSE isPlanar:FALSE
           colorSpaceName: NSCalibratedRGBColorSpace
           bitmapFormat:0 bytesPerRow:0 bitsPerPixel:24];
    
  return image;
}
@end
