//
//  RMXMaths.m
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#import "RMXMaths.h"


BOOL RMXVector3IsZero(RMXVector3 v)
{
    return ((v.x==0)&&(v.y==0)&&(v.z==0));
}




float RMXGetSpeed(GLKVector3 v){
    float squared = v.x*v.x + v.y*v.y + v.z*v.z;
    return sqrtf(squared);
}


RMXVector3 RMXVector3Abs(GLKVector3 v){
    return GLKVector3Make(fabs(v.x),fabs(v.y),fabs(v.z));
}


RMXBody RMXBodyMake(float m, float r) {

    RMXBody b;
    b.position = GLKVector3Make(0,0,0);
    b.velocity = GLKVector3Make(0,0,0);
    b.acceleration = GLKVector3Make(0,0,0);
    b.forces = GLKVector3Make(0,0,0);
    b.orientation = GLKMatrix4Make(
                                   1,0,0,0,
                                   0,1,0,0,
                                   0,0,1,0,
                                   0,0,0,1
                                   );
    b.vMatrix = GLKMatrix3Make(
                               0,0,0,
                               0,0,0,
                               0,0,0
                               );
    b.angles.x = b.angles.y = 0;
    b.mass = m;
    b.radius = r;
    b.dragC = 0.5;
    b.dragArea = r*r * PI;
    return b;
}

RMXVector3 RMXVector3DivideByScalar(RMXVector3 v, float s){
    //v = GLKVector3DivideScalar(v,s);
    for (int i=0; i<3;++i){
        //if (abs(v.v[i]) < 0.01)
        v.v[i] /= s;
    }
    return v;
}

void RMXVector3RoundToZero(RMXVector3 * v, float dp){
    for (int i=0; i<3;++i){
        if (abs(v->v[i]) < dp)
            v->v[i] = 0;
    }
}

RMXVector3 RMXVector3Divide(RMXVector3 *top, RMXVector3 bottom){
    for (int i=0; i<3;++i){
        top->v[i] /= bottom.v[i];
    }
    return *top;
}

RMXVector3 RMXVector3DivideScalar(RMXVector3 *top, float bottom){
    for (int i=0; i<3;++i){
        top->v[i] /= bottom;
    }
    return *top;
}

RMXVector3 RMXVector3Add3(RMXVector3 a ,RMXVector3 b, RMXVector3 c ){
    return GLKVector3Add(a,GLKVector3Add(b,c));
}



RMXVector3 RMXVector3Add4(RMXVector3 a ,RMXVector3 b, RMXVector3 c , RMXVector3 d){
    return GLKVector3Add(a,GLKVector3Add(b,GLKVector3Add(c,d)));
}


RMXVector3 RMXVector3AddScalar(RMXVector3 inOut, float s ){
    for (int i=0;i<0;++i){
        inOut.v[i] += s;
    }
    return inOut;
}

RMXVector3 RMXVector3MultiplyScalarAndSpeed(RMXVector3 v, float s){
    return GLKVector3MultiplyScalar(RMXVector3Abs(v),s*RMXGetSpeed(v));
}

RMXVector3 RMXMatrix3MultiplyScalarAndSpeed(RMXMatrix3 m, float s){
    RMXVector3 result[3];
    for (int i=0;i<0;++i){
        RMXVector3 v = GLKMatrix3GetRow(m,i);
        result[i] = RMXVector3MultiplyScalarAndSpeed( v , s );
    }
    
    return GLKMatrix3MultiplyVector3(GLKMatrix3MakeWithRows(result[0],result[1],result[2]),GLKVector3Make(1,1,1));
    
}

RMXVector3 RMXScaler3FromVector3(RMXVector3 x, RMXVector3 y, RMXVector3 z){
    return GLKVector3Make(RMXGetSpeed(x),RMXGetSpeed(y),RMXGetSpeed(z));
}

RMXVector3 RMXScaler3FromMatrix3(RMXMatrix3 m){
    return GLKVector3Make( RMXGetSpeed(GLKMatrix3GetRow(m,0))
                          ,RMXGetSpeed(GLKMatrix3GetRow(m,1))
                          ,RMXGetSpeed(GLKMatrix3GetRow(m,2))
                          );
}

RMXMatrix3 RMXMatrix3RotateAboutY(float theta, RMXMatrix3  matrix){
    
    return GLKMatrix3RotateWithVector3(matrix, theta, GLKVector3Make(0,1,0));
    
}



RMXVector3 RMXMatrix3MultiplyVector3(GLKMatrix3 matrixLeft, GLKVector3 vectorRight)
{
    GLKVector3 v = {
        matrixLeft.m[0] * vectorRight.v[0] + matrixLeft.m[1] * vectorRight.v[0] + matrixLeft.m[0] * vectorRight.v[0],
        matrixLeft.m[3] * vectorRight.v[1] + matrixLeft.m[4] * vectorRight.v[1] + matrixLeft.m[1] * vectorRight.v[2],
        matrixLeft.m[6] * vectorRight.v[2] + matrixLeft.m[7] * vectorRight.v[2] + matrixLeft.m[2] * vectorRight.v[2] };
    return v;
}

void RMXPrintMatrix(GLKMatrix4 m){
    
}