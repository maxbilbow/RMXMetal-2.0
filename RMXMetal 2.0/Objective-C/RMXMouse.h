//
//  RMXMouse.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXMouse_h
#define RMXMetal_2_0_RMXMouse_h


#endif

//@class RMXObject, UIViewController;

@protocol RMXAnyInput

- (void)toggleFocus;
- (void)centerView:(void(int x, int y))center;
- (void)calibrateView:(int)x vert:(int)y;
- (bool)hasFocus;

@end

@protocol RMXMouseOwner <RMXAnyInput>
- (void)setMousePos:(int)x y:(int)y;
- (void)mouse2view:(int)x y:(int)y;
//- (void)setPos:(int)x v:(int)y;
- (GLKVector2)getMouse;
@end

@interface RMXDPad : RMXObject
#if TARGET_OS_IPHONE
@property UIViewController* owner;
#endif
@end

@interface RMXMouse : RMXObject <RMXMouseOwner>
//@property bool focus;
@property int dx, dy;
@property GLKVector2 pos;
@property RMXDPad* dPad;
@property (getter=hasFocus) bool focus;
- (void)mouse2view:(int)x y:(int)y owner:(id)owner;
@end




