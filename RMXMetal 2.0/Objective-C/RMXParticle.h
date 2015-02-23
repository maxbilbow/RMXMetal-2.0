//
//  RMXParticle.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXParticle_h
#define RMXMetal_2_0_RMXParticle_h


#endif

//@class RMXObject;


/*
                                  
 Particle
 */
@interface RMXParticle : RMXObject // <RMXOrienrationProcessor>
@property (readonly) GLKVector3 eye, center, up;
@property GLKVector3 anchor,itemPosition;
@property RMXObject  * item; //return 1?;
@property (readonly) float weight, ground;
@property float armLength, reach, accelerationRate, speedLimit, squatLevel,rotationSpeed,jumpStrength;
@property BOOL limitSpeed, hasFriction, hasGravity, prepairingToJump, goingUp, effectedByAccelerometer;
- (void)accelerateForward:(float)velocity;
- (void)accelerateUp:(float)velocity;
- (void)accelerateLeft:(float)velocity;
- (void)forwardStop;
- (void)upStop;
- (void)leftStop;

- (NSString*)describePosition;

- (void)jump;
//- (void)setView;
- (void)debug;
- (void)animate;
- (void)manipulate;
- (bool)isGrounded;
- (void)push:(GLKVector3)direction;
- (void)plusAngle:(float)theta up:(float)phi;
- (void)prepareToJump;



@end

