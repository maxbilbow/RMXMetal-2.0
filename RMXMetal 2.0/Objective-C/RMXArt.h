//
//  RMXArt.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXArt_h
#define RMXMetal_2_0_RMXArt_h


#endif


float colorBronzeDiff[4]  = { 0.8, 0.6, 0.0, 1.0 };
float colorBronzeSpec[4]  = { 1.0, 1.0, 0.4, 1.0 };
float colorBlue[4]        = { 0.0, 0.0, 1.0, 1.0 };
float colorNone[4]        = { 0.0, 0.0, 0.0, 0.0 };
float colorRed[4]         = { 1.0, 0.0, 0.0, 1.0 };
float colorGreen[4]       = { 0.0, 1.0, 0.0, 1.0 };
float colorYellow[4]      = { 1.0, 0.0, 1.0, 1.0 };

@interface RMXArt : RMXObject
//#if TARGET_OS_IPHONE

//#else
@property float x, y, z, d, r,g, b,k;
//#endif
//+ (RMXWorld*)initializeTestingEnvironment:(id)sender;
+ (void)randomObjects:(RMXWorld*)sender;
+ (void)drawAxis:(float**)colors world:(RMXWorld*)world;
+ (GLKVector4)rColor;
@end
