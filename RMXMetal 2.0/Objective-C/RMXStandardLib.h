//
//  RMXStandardLib.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXStandardLib_h
#define RMXMetal_2_0_RMXStandardLib_h


#endif



@class RMXDrawShapes;
@class RMXObject;
@class RMXParticle;
@class RMXObserver;
@class RMXShapeObject;
@class RMXLightSource;
@class RMXPhysics;
@class RMXArt;
@class RMXWorld;
#if TARGET_OS_IPHONE
@class RMXGyro;
#else
@class RMXMouse;
#endif

@class RMXGameView;
@class RMXWorld;


#import <Foundation/Foundation.h>
#import <complex.h>
#import <math.h>
#import <GLKit/GLKit.h>

#import "RMXDataTypes.h"

#import "RMXMaths.h"

#import "RMXDrawShapes.h"

#import "RMXDebugger.h"

#import "RMXObject.h"
#import "RMXParticle.h"
#import "RMXObserver.h"




#import "RMXPhysics.h"

#import "RMXDrawable.h"

#import "RMXArt.h"
#import "RMXWorld.h"
#if TARGET_OS_IPHONE
#import "RMXGyro-swift.h"
#else
#import "RMXMouse.h"
#endif





