//
//  RMXObject.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 21/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_RMXObject_h
#define OpenGL_2_0_RMXObject_h


#endif


#import <Foundation/Foundation.h>

//@import UIKit;
//@class RMXObject, RMXGameView;
//#import <GLKit/GLKit.h>
//#import "RMXDataTypes.h"
//#import "RMXPhysics.h"
//#import "RMXWorld.h"
//#import "RMXObject.h"
#import "RMXStandardLib.h"


@implementation RMXObject : NSObject
@synthesize  name = _name, parent = _parent, world = _world, physics = _physics, isAnimated = _isAnimated,gameView = _gameView;
//#if TARGET_OS_IPHONE
@synthesize uiView = _uiView;
//#endif
- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world{
    self = [super init];
    _parent = parent;
    _world = world;
#if TARGET_OS_IPHONE
    if (world != nil){// && [world isKindOfClass:[RMXWorld class]]){
        if (((RMXWorld*)world).uiView != nil) _uiView = ((RMXWorld*)world).uiView;
        if (((RMXWorld*)world).gameView != nil) _gameView = ((RMXWorld*)world).gameView;
    } else if (world == nil) {
        if ([parent isKindOfClass:[UIViewController class]]) {
            _uiView = (UIViewController*) parent;
      //  if ([parent isKindOfClass:[RMXGameView class]])
             _gameView = ((RMXWorld*)world).gameView;
        }
    }
#endif
    _name = name;
    _physics = (world != nil) ? world.physics : [[RMXPhysics alloc]initWithName:@"Root Node" parent:parent world: [self isKindOfClass:[RMXWorld class]] ? (RMXWorld*) self : nil];
    [self reInit];
        return self;
}

- (void)reInit {
    body = RMXBodyMake(1.0, 1.0);
}
- (void)debug {
    //[rmxDebugger add:RMX_ERROR n:self t:_name];
}

- (GLKVector3)upVector{
    GLKVector4 v = GLKMatrix4GetColumn(GLKMatrix4Transpose(body.orientation),1);
    return GLKVector3Make(v.x,v.y,v.z);
}

- (GLKVector3)rightVector{
    GLKVector4 v = GLKMatrix4GetColumn(GLKMatrix4Transpose(body.orientation),0);
    return GLKVector3Negate(GLKVector3Make(v.x,v.y,v.z));
}

- (GLKVector3)leftVector{
    GLKVector4 v = GLKMatrix4GetColumn(GLKMatrix4Transpose(body.orientation),0);
    return GLKVector3Make(v.x,v.y,v.z);
}

- (GLKVector3)forwardVector{
    GLKVector4 v = GLKMatrix4GetColumn(GLKMatrix4Transpose(body.orientation),2);
    return GLKVector3Make(v.x,v.y,v.z);
}

@end


