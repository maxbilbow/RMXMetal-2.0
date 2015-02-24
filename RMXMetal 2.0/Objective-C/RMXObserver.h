//
//  RMXObserver.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXObserver_h
#define RMXMetal_2_0_RMXObserver_h


#endif

//@class Mouse, Mouse, RMXGyro, Particle;

@import CoreMotion;

@protocol RMXPointOfView
- (GLKMatrix4)makeLookAt:(GLKMatrix4(float eyeX,float eyeY, float eyeZ, float cx,float cy, float cz, float ux,float uy, float uz ))lookAt;
- (void)makeLookAtGl:(void(double eyeX,double eyeY, double eyeZ, double cx,double cy, double cz, double ux,double uy, double uz ))lookAt;
@property (readonly)NSString* viewDescription;

@end

@protocol RMXOrienrationProcessor

//- (void)rotate;
- (void)plusAngle:(float)theta up:(float)phi;
@end


@interface RMXObserver : RMXParticle // <RMXMouseOwner,RMXPointOfView>
#if TARGET_OS_IPHONE
#else
@property RMXMouse *mouse;
#endif
@property (readonly) GLKMatrix4 modelViewMatrix, projectionMatrix;

- (id)initWithUI:(RMXGameView*)gameView;
- (void)debug;
- (void)grabObject:(RMXObject*)i;
- (void)throwItem:(float)strength;
@end
