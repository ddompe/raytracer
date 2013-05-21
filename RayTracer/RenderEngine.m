//
//  RenderEngine.m
//  RayTracer
//
//  Created by Diego Dompe on 5/20/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import "RenderEngine.h"
#import "VisibleObject.h"

@implementation RenderEngine

- (NSBitmapImageRep *) rayTraceScene: (Scene *)scene
                           withEyeAt: (RTVector *)eye
                   andViewPortOrigin: (RTVector *)origin
                                size: (NSSize) size;
{
  NSBitmapImageRep *image;
  int i,j,k;
  
  image = [[NSBitmapImageRep alloc]
           initWithBitmapDataPlanes: NULL
           pixelsWide:size.width
           pixelsHigh:size.height
           bitsPerSample:8
           samplesPerPixel:3
           hasAlpha:FALSE isPlanar:FALSE
           colorSpaceName: NSCalibratedRGBColorSpace
           bitmapFormat:0 bytesPerRow:0 bitsPerPixel:24];
  
  for (i = 0; i < size.width ; i++) {
    for (j = 0; j < size.height ; j++)
    {
      NSObject <VisibleObject> *winner = NULL, *obj;
      float t, minT = 0.0;
      RTVector pixel;
      NSUInteger color[3] = {0xff, 0xff, 0xff};
      NSUInteger *finalColor, *colorPtr;
      
      // TODO: calculate point of intersection into the viewport grid
 
      /* Find the closest object */
      for (k = 0; k < [[scene objects] count] ; k++)
      {
        
        obj = [[[scene objects] allObjects] objectAtIndex:k];
        [obj doesItersectsRayWithOriginAt:eye
                         andTerminationAt:&pixel
                            storeResultAt:&t];
        if (t > 0 && t < minT)
        {
          winner = obj;
          minT = t;
        }
      }
      
      /* Calculate the pixel color if we hit an object */
      if (t != 0.0)
      {
        colorPtr = [winner color];
      }
      
      /* Get the color */
      if (t == 0.0)
        finalColor = [scene bgColor];
      else
        finalColor = color;
      
      /* Paint */
      [image setPixel:finalColor atX:i y:j];
    }
  }
  return image;
}
@end
