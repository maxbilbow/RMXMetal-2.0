//
//  ShapeObject.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 25/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//


#import "RMXStandardLib.h"

@implementation RMXShapeObject
    //GLKVector4 position;
@synthesize rotation = _rotation, color = _color, isRotating = _isRotating, rAxis = _rAxis, shine = _shine, type = _type, gl_light = _gl_light,  w = _w, renderer = _renderer, shape = _shape;

    const float nill[4] = {0,0,0,0};



- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world
{
    self = [super initWithName:name parent:parent world:world];
    if (self) {
        self.color = GLKVector4Make(1,1, 1, 10);
        self.rAxis = GLKVector3Make(0,0,1);
        self.rotation = 0;
        self.isRotating = false;
        body = RMXBodyMake(1,1);
       
    }
    return self;
    
}
- (void)setRenderer:(id)renderer shape:(SEL)shape{
    _renderer = renderer;
    _shape = @selector(shape);
}

- (void)render {
#if TARGET_OS_IPHONE
#else
        glPushMatrix();
    
        glRotatef(_rotation, _rAxis.x, _rAxis.y, _rAxis.z);
        
        glPushMatrix();
        
        glTranslatef(self.anchor.x,self.anchor.y, self.anchor.z);
        glTranslatef(body.position.x,body.position.y,body.position.z);
#endif
    
    [self setMaterial];
    [_renderer shape];
    [self unsetMaterial];

#if TARGET_OS_IPHONE
#else
        glPopMatrix();
        glPopMatrix();
#endif
    
}


- (void)animate
{
    //if (temp) tester.checks[9] += "\nSHAPE:\n" + toString();
    if (_isRotating) _rotation += _dt;//*dift;// * 30;
    [super animate];
    if (self.shine != nil )
        _shine(_gl_light, _type, GLKVector4MakeWithVector3(body.position, _w).v);
    [self render];
   // [_renderer shape];
    
}

- (void)setMaterial
{
#if TARGET_OS_IPHONE
#else
    //glMaterialfv(GL_FRONT, GL_EMISSION, self.color.v);
    glMaterialfv(GL_FRONT, GL_SPECULAR, self.getColorfv);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, self.getColorfv);
#endif
}

- (void)unsetMaterial
{
#if TARGET_OS_IPHONE
#else
    //glMaterialfv(GL_FRONT, GL_EMISSION,nill);
    glMaterialfv(GL_FRONT, GL_SPECULAR,nill);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, nill);
#endif
}

- (float*)getColorfv
{
    return _color.v;
}


- (void)setColorfv:(float*)c
{
    _color = GLKVector4MakeWithArray(c);
}

- (void)debug {
    [super debug];
    [rmxDebugger add:RMX_OBSERVER n:self t:[self describePosition] ];
}


@end