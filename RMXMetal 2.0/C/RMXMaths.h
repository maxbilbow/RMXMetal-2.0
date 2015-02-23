//
//  Maths.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 20/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_Maths_h
#define OpenGL_2_0_Maths_h


#endif


#define _INFINITY               99999
#define PI                      3.14159265358979323846
#define PI_OVER_180             (PI / 180)




BOOL RMXVector3IsZero(GLKVector3 v);
float RMXGetSpeed(GLKVector3 v);
//
RMXBody RMXBodyMake(float m, float r);
RMXVector3 RMXVector3DivideByScalar(RMXVector3 v, float s);

void RMXVector3RoundToZero(RMXVector3 * v, float dp);
RMXVector3 RMXVector3Divide(RMXVector3 *top, RMXVector3 bottom);
RMXVector3 RMXVector3DivideScalar(RMXVector3 *top, float bottom);
RMXVector3 RMXVector3Add3(RMXVector3 a ,RMXVector3 b, RMXVector3 c );

RMXVector3 RMXVector3Add4(RMXVector3 a ,RMXVector3 b, RMXVector3 c , RMXVector3 d);
RMXVector3 RMXVector3AddScalar(RMXVector3 inOut, float s );
RMXVector3 RMXVector3MultiplyScalarAndSpeed(RMXVector3 v, float s);
RMXVector3 RMXMatrix3MultiplyScalarAndSpeed(RMXMatrix3 m, float s);
RMXVector3 RMXScaler3FromVector3(RMXVector3 x, RMXVector3 y, RMXVector3 z);
RMXVector3 RMXScaler3FromMatrix3(RMXMatrix3 m);
RMXMatrix3 RMXMatrix3RotateAboutY(float theta, RMXMatrix3  matrix);

RMXVector3 RMXMatrix3MultiplyVector3(GLKMatrix3 matrixLeft, GLKVector3 vectorRight);
void RMXPrintMatrix(GLKMatrix4 m);



////EQUARIONS:
GLKVector4 RMXSomeCircle (int i);
float rFloat(int radius);

GLKVector4 doASum(float radius, int i, int noOfShapes );
float rFloat(int radius);
GLKVector4 RMXSomeCircle (int i);
GLKVector4 randomSpurt (float i);
float rmxEquateContours(float x, float y);
float rmxEquateCircle(float x, float y, float r, float plane);
GLKVector4 point_on_circle ( double radius, double angle_in_degrees,  double centre);