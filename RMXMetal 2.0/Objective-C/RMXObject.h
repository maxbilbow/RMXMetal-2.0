//
//  RMXObject.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXObject_h
#define RMXMetal_2_0_RMXObject_h


#endif


@protocol RMXObject
@property (readonly) NSString * name;
@property RMXObject * parent;
@property RMXWorld * world;
@property RMXPhysics * physics;
@property RMXGameView* gameView;
//@property RMXPhysicsBody body;

@property BOOL isAnimated;
//#if TARGET_OS_IPHONE
@property UIViewController * uiView;
//#endif
@property (readonly) GLKVector3 upVector, rightVector, forwardVector, leftVector;
//@property (readonly) RMXV3 position;
- (id)initWithName:(NSString*)name parent:(RMXObject*)parent world:(RMXWorld*)world;
- (void)debug;
- (void)reInit;
@end

@interface RMXObject : NSObject <RMXObject> {
    @public RMXBody body;
}
@end
