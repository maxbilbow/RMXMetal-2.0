//
//  shapes.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 23/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_shapes_h
#define OpenGL_2_0_shapes_h


#endif


//#import "RMXStandardLib.h"
#import <GLKit/GLKit.h>
#import "RMXDrawShapes.h"

@implementation RMXDrawShapes

+ (void)DrawCubeFace:(float)fSize
{
    fSize /= 2.0;
#if TARGET_OS_IPHONE
#else
    glBegin(GL_QUADS);
    
    glVertex3f(-fSize, -fSize, fSize);    glTexCoord2f (0, 0);
    glVertex3f(fSize, -fSize, fSize);   glTexCoord2f (1, 0);
    glVertex3f(fSize, fSize, fSize);     glTexCoord2f (1, 1);
    glVertex3f(-fSize, fSize, fSize);     glTexCoord2f (0, 1);
    glEnd();
#endif
}



+ (void)DrawCubeWithTextureCoords:(float)fSize
{
    //NSLog(@"Hello!");
#if TARGET_OS_IPHONE
#else
    glPushMatrix();
    DrawCubeFace (fSize);
    glRotatef (90, 1, 0, 0);
    DrawCubeFace (fSize);
    glRotatef (90, 1, 0, 0);
    DrawCubeFace (fSize);
    glRotatef (90, 1, 0, 0);
    DrawCubeFace (fSize);
    glRotatef (90, 0, 1, 0);
    DrawCubeFace (fSize);
    glRotatef (180, 0, 1, 0);
    DrawCubeFace (fSize);
    glPopMatrix();
    
    const GLfloat verts[] = {
        0.0f,   1.0f,   0.0f,
        -1.0f,  -1.0f,  0.0f,
        1.0f,   -1.0f,  0.0f
    };

    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(3, GL_FLOAT, 0, verts);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 3);
#endif
    
}



+ (void)DrawSpheree:(double)r lats:(int)lats longs:(int)longs
{
#if TARGET_OS_IPHONE
    
#else
          int i, j;
          for(i = 0; i <= lats; i++) {
                  double lat0 = M_PI * (-0.5 + (double) (i - 1) / lats);
                  double z0  = sin(lat0);
                  double zr0 =  cos(lat0);
        
                  double lat1 = M_PI * (-0.5 + (double) i / lats);
                  double z1 = sin(lat1);
                  double zr1 = cos(lat1);
        
                  glBegin(GL_QUAD_STRIP);
                  for(j = 0; j <= longs; j++) {
                        double lng = 2 * M_PI * (double) (j - 1) / longs;
                          double x = cos(lng);
                          double y = sin(lng);
            
                          glNormal3f(x * zr0, y * zr0, z0);
                        glVertex3f(x * zr0, y * zr0, z0);
                          glNormal3f(x * zr1, y * zr1, z1);
                          glVertex3f(x * zr1, y * zr1, z1);
                      }
                  glEnd();
        }
#endif
}


+ (void)DrawSphere:(float)size{
    [RMXDrawShapes DrawSpheree:size lats:size longs:size];
}



+ (void)RenderObjects
{
#if TARGET_OS_IPHONE
    
#else

    glMatrixMode(GL_MODELVIEW);
    
    glPushMatrix();
    // Main object (cube) ... transform to its coordinates, and render
    glRotatef(15, 1, 0, 0);
    glRotatef(45, 0, 1, 0);
    glRotatef(g_fTeapotAngle, 0, 0, 1);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, colorBlue);
    glMaterialfv(GL_FRONT, GL_SPECULAR, colorNone);
    glColor4fv(colorBlue);
    glBindTexture(GL_TEXTURE_2D, TEXTURE_ID_CUBE);
    DrawCubeWithTextureCoords(1.0);
    // Child object (teapot) ... relative transform, and render
    glPushMatrix();
    glTranslatef(2, 0, 0);
    glRotatef(g_fTeapotAngle2, 1, 1, 0);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, colorBronzeDiff);
    glMaterialfv(GL_FRONT, GL_SPECULAR, colorBronzeSpec);
    glMaterialf(GL_FRONT, GL_SHININESS, 50.0);
    glColor4fv(colorBronzeDiff);
    glBindTexture(GL_TEXTURE_2D, 0);
    glutSolidTeapot(0.3);
    glPopMatrix();
    glPopMatrix();
    
#endif
}




+ (void)DrawTeapot:(float)f{
#if TARGET_OS_IPHONE
#else
    glRotatef(g_fTeapotAngle2, 1, 1, 0);
#endif
}



+ (void)DrawPlane:(float)x
{
#if TARGET_OS_IPHONE
    
#else
    const GLfloat verts[] = {
        -INFINITY,   -0.001,   -INFINITY,
        -INFINITY,-0.001,_INFINITY,
        _INFINITY,-0.001,_INFINITY,
        _INFINITY,-0.001, -INFINITY
    };
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(3, GL_FLOAT, 0, verts);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 3);
    

    glPushMatrix();
    glColor4fv(colorBlue);
    
    glTranslatef(0, -1, 0);
    glBegin(GL_QUADS);
    glVertex3f( -_INFINITY,-0.001, -_INFINITY);
    glVertex3f( -_INFINITY,-0.001,_INFINITY);
    glVertex3f(_INFINITY,-0.001,_INFINITY);
    glVertex3f(_INFINITY,-0.001, -_INFINITY);
    glEnd();
    glColor4fv(colorNone);
    glPopMatrix();
    
    
    //        glBegin(GL_LINES);
    //        for(int i=0;i<=10;i++) {
    //            if (i==0) { glColor3f(.6,.3,.3); } else { glColor3f(.25,.25,.25); };
    //            glVertex3f(i,0,0);
    //            glVertex3f(i,0,10);
    //            if (i==0) { glColor3f(.3,.3,.6); } else { glColor3f(.25,.25,.25); };
    //            glVertex3f(0,0,i);
    //            glVertex3f(10,0,i);
    //        };
    //        glEnd();
#endif
}


+ (void)DrawFog{
    
GLfloat density = 0.0005;

GLfloat fogColor[4] = {0.9, 0.6, 0.9, 1.0};
#if TARGET_OS_IPHONE
    
#else
    glEnable (GL_FOG);
    glFogi (GL_FOG_MODE, GL_EXP2);
    
    glFogfv (GL_FOG_COLOR, fogColor);
    
 
    
    glFogf (GL_FOG_DENSITY, density);
    

    
    glHint (GL_FOG_HINT, GL_NICEST);
    
    //glClearColor (0.0,0.0,0.0,1.0);
    
    //glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    

#endif

}

@end