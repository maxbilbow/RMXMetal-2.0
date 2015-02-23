//
//  Maths.metal
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#import <metal_stdlib>
using namespace metal;


//
//  RMXDataTypes.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 21/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//


typedef float3 RMXVector3;
typedef float4 RMXVector4;
typedef float3x3 RMXMatrix3;
typedef float4x4 RMXMatrix4;


typedef struct _RMXMetalBody
{

    RMXVector4 position;
    RMXVector4 velocity;
    RMXVector4 acceleration;
    RMXVector4 forces;
    RMXMatrix4 mOrientation;
    RMXMatrix4 mVelocity;
    RMXMatrix4 mForces;
    float theta;
    float phi;
    float radius;
    float mass;
    float dragC;
    float dragArea;
    
}RMXMetalBody;
