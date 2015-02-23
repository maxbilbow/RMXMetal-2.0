//
//  RMXGyro-swift.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXGyro_swift_h
#define RMXMetal_2_0_RMXGyro_swift_h


#endif

//@import CoreMotion;


@protocol _RMXGyro // : CMMotionManager

@property float hRotation, vRotation, cameraMovementSpeed;
@property RMXWorld* world;
@property RMXGameView * gameView;

- (id)initWithGameView:(RMXGameView*)gameView;
- (void)Update;
- (void)interpretAccelerometerData;
- (void)interpretAccelerometerDataFor:(RMXParticle*)particle;
@end

