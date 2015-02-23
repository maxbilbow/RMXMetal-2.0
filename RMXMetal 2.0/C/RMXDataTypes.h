//
//  RMXDataTypes.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 21/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_RMXDataTypes_h
#define OpenGL_2_0_RMXDataTypes_h


#endif




typedef GLKVector2 RMXVector2;
typedef GLKVector3 RMXVector3;
typedef GLKMatrix3 RMXMatrix3;
typedef GLKMatrix4 RMXMatrix4;

typedef struct _RMXPhysicsBody
{
    
    RMXVector3 position;
    RMXVector3 velocity;
    RMXVector3 acceleration;
    RMXVector3 forces;
    
    RMXMatrix4 orientation;
    RMXMatrix3 vMatrix;
    RMXVector2 angles;
    
    float radius;
    float mass;
    float dragC;
    float dragArea;
    
} RMXPhysicsBody;
typedef RMXPhysicsBody RMXBody;

