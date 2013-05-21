//
//  Scene.h
//  RayTracer
//
//  Created by Diego Dompe on 5/19/13.
//  Copyright (c) 2013 Diego Dompe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scene : NSObject {
  NSMutableSet *objects;
  NSMutableSet *lightSources;
}

@end
