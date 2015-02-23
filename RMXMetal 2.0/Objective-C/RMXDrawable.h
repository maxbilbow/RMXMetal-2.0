//
//  RMXShapeObject.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXShapeObject_h
#define RMXMetal_2_0_RMXShapeObject_h


#endif
/*
 Shpes
 */

@protocol RMXDrawable <RMXObject>
@property  GLKVector4 color;
@property  bool isRotating;
@property  GLKVector3 rAxis;
@property float rotation,  w;
@property GLenum type, gl_light;
@property SEL shape;
@property id renderer;
@property void(*shine)(GLenum, GLenum, const float*);
- (void)setMaterial;
- (void)unsetMaterial;
- (float*)getColorfv;
- (void)render;
- (void)setRenderer:(id)renderer shape:(SEL)shape;
@end


@interface RMXShapeObject : RMXParticle <RMXDrawable>


@end

@interface RMXLightSource : RMXShapeObject

@end




