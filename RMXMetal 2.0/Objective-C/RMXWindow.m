//
//  Interface.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 23/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_Interface_h
#define OpenGL_2_0_Interface_h


#endif

//#include "RattleGLI.h"
//void init();
//template <typename Particle>

@interface RMXWindow :  RMXObject
@property float fViewDistance, nearPlane, farPlane;
@property int winID;
@property (getter = isFullscreen) bool fullscreen;
@property GLKVector2 wsize;
@property const char * title;
@property void
//Display
(*initWindowSize)(int width, int height),
//(*initDisplayMode)(unsigned int mode),
(*displayFunc)(void (*func)(void)),
(*reshapeFunc)(void (*func)(int width, int height)),
//Keyboard
(*keyPressed)(void (*func)(unsigned char key, int x, int y)),
(*keyUp)(void (*func)(unsigned char key, int x, int y)),
(*keySpecial)(void (*func)(int key, int x, int y)),
(*keySpecialUp)(void (*func)(int key, int x, int y)),
//Mouse
(*mouseFunc)(void (*func)(int button, int state, int x, int y)),
(*motionFunc)(void (*func)(int x, int y)),
(*passiveMotionFunc)(void (*func)(int x, int y)),
//Other
(*idleFunc)(void (*func)(void));

- (id)initWithMethods:
//Display
(void(int width, int height))initWindowSize
//void (*initDisplayMode)(unsigned int mode),
                 disp:(void(void (*func)(void)))displayFunc
                   rs:(void(void (*func)(int width, int height)))reshapeFunc
//Keyboard
                   kp:(void(void (*func)(unsigned char key, int x, int y)))keyPressed
                   ku:(void(void (*func)(unsigned char key, int x, int y)))keyUp
                   ks:(void(void (*func)(int key, int x, int y)))keySpecial
                  ksu:(void(void (*func)(int key, int x, int y)))keySpecialUp
//Mouse
                   mf:(void(void (*func)(int button, int state, int x, int y)))mouseFunc
                   mF:(void(void (*func)(int x, int y)))motionFunc
                  pmf:(void(void (*func)(int x, int y)))passiveMotionFunc
//Other
                   iF:(void(void (*func)(void)))idleFunc;

- (void)toggleFullScreen RMX_DEPRECATED(10_0, 10_9);
- (void)create:(int(const char * s))createWindow;
- (void)display:(void(void))display rs:(void(int width, int height))reshape;
- (void)keyboard:(void(unsigned char key, int x, int y))pressed
              up:(void(unsigned char key, int x, int y))up
              sp:(void(int key, int x, int y))special
             spU:(void(int key, int x, int y))specialUp;

- (void)mouse:(void(int button, int state, int x, int y))mouse
              m:(void(int x, int y))motion
              pm:(void(int x, int y))passiveMotion;

- (void)idle:(void (void))func;

@end

@implementation RMXWindow

   //GLKVector2 size;
@synthesize fViewDistance, nearPlane, farPlane, fullscreen, winID, wsize;
        //template <typename Number>
    const char * title = "Rattle X Window";



- (float)width {
    return wsize.x;
}

- (float)height {
    return wsize.y;
}


    void
    //Display
    (*initWindowSize)(int width, int height),
    //(*initDisplayMode)(unsigned int mode),
    (*displayFunc)(void (*func)(void)),
    (*reshapeFunc)(void (*func)(int width, int height)),
    //Keyboard
    (*keyPressed)(void (*func)(unsigned char key, int x, int y)),
    (*keyUp)(void (*func)(unsigned char key, int x, int y)),
    (*keySpecial)(void (*func)(int key, int x, int y)),
    (*keySpecialUp)(void (*func)(int key, int x, int y)),
    //Mouse
    (*mouseFunc)(void (*func)(int button, int state, int x, int y)),
    (*motionFunc)(void (*func)(int x, int y)),
    (*passiveMotionFunc)(void (*func)(int x, int y)),
    //Other
    (*idleFunc)(void (*func)(void));
   // (*initalise)(void);
    


- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world
{
    self = [super initWithName:name parent:parent world:world];
    wsize.y = 600;
    wsize.x = 600;
    fViewDistance = 3 * VIEWING_DISTANCE_MIN;
    nearPlane = 1;
    farPlane = world->body.radius*2;
    fullscreen = RMX_FULL_SCREEN;

    return self;
}
    

//    
//    GLKVector2 getSize(){
//        return size;
//    }

- (void)setSize:(int)width h:(int)height
{
    wsize.x = width;
    wsize.y = height;
}
    


    //Glut Init
- (id)initWithMethods:
              //Display
              (void(int width, int height))initWindowSize
              //void (*initDisplayMode)(unsigned int mode),
                 disp:(void(void (*func)(void)))displayFunc
                   rs:(void(void (*func)(int width, int height)))reshapeFunc
              //Keyboard
kp:(void(void (*func)(unsigned char key, int x, int y)))keyPressed
              ku:(void(void (*func)(unsigned char key, int x, int y)))keyUp
              ks:(void(void (*func)(int key, int x, int y)))keySpecial
              ksu:(void(void (*func)(int key, int x, int y)))keySpecialUp
              //Mouse
              mf:(void(void (*func)(int button, int state, int x, int y)))mouseFunc
              mF:(void(void (*func)(int x, int y)))motionFunc
              pmf:(void(void (*func)(int x, int y)))passiveMotionFunc
              //Other
              iF:(void(void (*func)(void)))idleFunc//,
             // void (*init)(void)

{
    self = [super init];
    //Set Display
    self.initWindowSize = initWindowSize;
    //self.initDisplayMode = initDisplayMode;
    self.displayFunc = displayFunc;
    self.reshapeFunc = reshapeFunc;
    //Set Keyboard
    self.keyPressed = keyPressed;
    self.keyUp = keyUp;
    self.keySpecial = keySpecial;
    self.keySpecialUp = keySpecialUp;
    //Set Mouse
    self.mouseFunc = mouseFunc;
    self.motionFunc = motionFunc;
    self.passiveMotionFunc = passiveMotionFunc;
    //Other
    self.idleFunc = idleFunc;
    
    
    //self.initDisplayMode(
    //init();
    return self;
}
    
- (void)toggleFullScreen
{
    /*
    if (fullscreen) {
        
        glutLeaveGameMode();
        glutInitWindowSize ([self width], [self height]);
        //glutInitWindowPosition (100, 100);
        [self create:glutCreateWindow];
        //EXIT GAME MODE
        
        fullscreen = false;
    } else {
        glutDestroyWindow(winID);
        winID = glutEnterGameMode();
        glutPostRedisplay();
        fullscreen = true;
    }
    */
}
    
- (void)create:(int(const char * s))createWindow
{
        initWindowSize([self width], [self height]);
        winID = createWindow(title);
}
    
    
- (void)display:(void(void))display rs:(void(int width, int height))reshape
{
        displayFunc(display);
        reshapeFunc(reshape);
}



- (void)keyboard:(void(unsigned char key, int x, int y))pressed
              up:(void(unsigned char key, int x, int y))up
              sp:(void(int key, int x, int y))special
             spU:(void(int key, int x, int y))specialUp
{
        keyPressed(pressed);
        keyUp(up);
        keySpecial(special);
        keySpecialUp(specialUp);
        
}

    
- (void)mouse:(void(int button, int state, int x, int y))mouse
            m:(void(int x, int y))motion
           pm:(void(int x, int y))passiveMotion
{
    mouseFunc(mouse);
    motionFunc(motion);
    passiveMotionFunc(passiveMotion);
}

- (void)idle:(void (void))func
{
    idleFunc(func);
}

- (void)debug {
    [rmxDebugger add:RMX_WINDOW n:self t:[NSString stringWithFormat:@"%@ debug not set up",self.name]];
}

@end


RMXWindow * window;// = RMXWindow;

Observer * observer;// = * Observer();

