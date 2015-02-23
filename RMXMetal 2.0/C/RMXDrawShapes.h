//
//  RMXDrawShapes.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXDrawShapes_h
#define RMXMetal_2_0_RMXDrawShapes_h

#endif



#define VIEWING_DISTANCE_MIN  3.0
#define TEXTURE_ID_CUBE 1
enum {
    MENU_LIGHTING = 1,
    MENU_POLYMODE,
    MENU_TEXTURING,
    MENU_EXIT
};

static BOOL g_bLightingEnabled = TRUE;
static BOOL g_bFillPolygons = TRUE;
static BOOL g_bTexture = FALSE;
static BOOL g_bButton1Down = FALSE;
static GLfloat g_fTeapotAngle = 0.0;
static GLfloat g_fTeapotAngle2 = 0.0;
//static GLfloat g_fViewDistance = 3 * VIEWING_DISTANCE_MIN;
//static GLfloat g_nearPlane = 1;
//static GLfloat g_farPlane = 1000;
//    int g_Width = 600;                          // Initial window width
//    int g_Height = 600;                         // Initial window height
static int g_yClick = 0;





@interface RMXDrawShapes : NSObject {
    
}

+ (void)DrawCubeFace:(float)fSize;
+ (void)DrawCubeWithTextureCoords:(float)fSize;
+ (void)DrawSpheree:(double)r lats:(int)lats longs:(int)longs;
+ (void)DrawSphere:(float) size;
+ (void)RenderObjects;
+ (void)DrawTeapot:(float)f;
+ (void)DrawPlane:(float)x;
+ (void)DrawFog;

@end



