//
//  Perspective.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 23/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_Perspective_h
#define OpenGL_2_0_Perspective_h


#endif




// Position of light
#ifdef _WIN32
static DWORD last_idle_time;
#else
static struct timeval last_idle_time;
#endif




void animate(void)
{
    //float dt;
#ifdef _WIN32
    DWORD time_now;
    time_now = GetTickCount();
    dt = (float) (time_now - last_idle_time) / 1000.0;
#else
    // Figure out time elapsed since last call to idle function
    struct timeval time_now;
    gettimeofday(&time_now, NULL);
    _dt = (float)(time_now.tv_sec  - last_idle_time.tv_sec) +
    1.0e-6*(time_now.tv_usec - last_idle_time.tv_usec);
#endif
    // Animate the teapot by updating its angles
    g_fTeapotAngle += _dt * 30.0;
    g_fTeapotAngle2 += _dt * 100.0;
   
    // Save time_now for next time
    last_idle_time = time_now;
    // Force redraw
    glutPostRedisplay();

}


void AnimateScene(void)
{
    animate();
    [world animate];
    //[sun draw:DrawSphere];
    DrawFog();
    //[art animate];
   // getDt();
    glutPostRedisplay();
}

void reshape (int width, int height) {
    [window setSize:width h:height]; //glutGet(GLUT_WINDOW_WIDTH);
   // window.height = height;// glutGet(GLUT_WINDOW_HEIGHT);
    glViewport(0, 0, [window width], [window height]);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(65.0, (float)[window width] / [window height], window.nearPlane, window.farPlane);
    //GLKMatrix4MakePerspective(65*PI_OVER_180 ,(float)window.width / window.height, window.nearPlane, window.farPlane);
    glMatrixMode(GL_MODELVIEW);
}

void debug();

bool alt = true;
void display (void) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glClearColor(art.r,art.g,art.b,art.k);
    [rmxDebugger add:RMX_DISPLAY_PROCESSOR n:@"DisplayProcessor" t:[NSString stringWithFormat:@"r%f, g%f, b%f, k%f",art.r,art.g,art.b,art.k]];
    glLoadIdentity(); // Load the Identity Matrix to reset our drawing locations
    [observer makeLookAtGl:gluLookAt];
  
    
    repeatedKeys();
    AnimateScene();
       // Make sure changes appear onscreen
    glutSwapBuffers();
    glFlush();
    debug();
    //tester.checks[1] = observer->toString();
   
    
}



