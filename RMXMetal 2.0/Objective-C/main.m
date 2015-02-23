//
//  main.m
//  OpenGL 2.1 (OC)
//
//  Created by Max Bilbow on 15/02/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import "oHeader.h"

void InitGraphics(void)
{
    int width, height;
    int nComponents;
    void* pTextureImage;
    
    
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glShadeModel(GL_SMOOTH);
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    //glEnable(GL_LIGHT1);
    // Create texture for cube; load marble texture from file and bind it
    //pTextureImage = read_texture("marble.rgb", &width, &height, &nComponents);
    glBindTexture(GL_TEXTURE_2D, TEXTURE_ID_CUBE);
    gluBuild2DMipmaps(GL_TEXTURE_2D,     // texture to specify
                      GL_RGBA,           // internal texture storage format
                      width,             // texture width
                      height,            // texture height
                      GL_RGBA,           // pixel format
                      GL_UNSIGNED_BYTE,	// color component format
                      pTextureImage);    // pointer to texture image
    glTexParameterf (GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameterf (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,
                     GL_LINEAR_MIPMAP_LINEAR);
    glTexEnvf (GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
}


int init()
{
    initKeys();

    //    window = [[RMXWindow alloc]initWithMethods:glutInitWindowSize
//                                               disp:glutDisplayFunc rs:glutReshapeFunc
//                                               kp:glutKeyboardFunc ku:glutKeyboardUpFunc ks:glutSpecialFunc ksu:glutSpecialUpFunc
//                                               mf:glutMouseFunc mF:glutMotionFunc pmf:glutPassiveMotionFunc
//                                               iF:glutIdleFunc];
    
    glutInitDisplayMode ( GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
    
    
    if ([window isFullscreen]){//&&glutGameModeGet(GLUT_GAME_MODE_POSSIBLE)){
        glutEnterGameMode();
    }else {
        NSLog(@"Game Mode Not Possibe, Exit: %i",glutGameModeGet(GLUT_GAME_MODE_POSSIBLE));
        //window.create(glutCreateWindow);
        //[window create:glutCreateWindow];
        glutInitWindowPosition(100,100);
        glutInitWindowSize(640,360);
        glutCreateWindow(window.title);
    }
    
    //Setup Display:
    //[window display:display rs:reshape];
    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    
    // Register callbacks:
    //[window keyboard:RMXkeyPressed up:RMXkeyUp sp:RMXkeySpecial spU:RMXkeySpecialUp];
    glutKeyboardFunc(RMXkeyPressed);
    glutKeyboardUpFunc(RMXkeyUp);
    glutSpecialFunc(RMXkeySpecial);
    glutSpecialUpFunc(RMXkeySpecialUp);
    
    //Mouse Callbacks:
    //[window mouse:MouseButton m:MouseMotion pm:mouseFree];
   
    glutMouseFunc(MouseButton);
    glutMotionFunc(MouseMotion);
    glutPassiveMotionFunc(mouseFree);
    
    //Animation
    // [window idle:AnimateScene];
    glutIdleFunc(AnimateScene);
    
    // Create our popup menu
    //BuildPopupMenu();
    InitGraphics();
    glutAttachMenu (GLUT_RIGHT_BUTTON);
    // Get the initial time, for use by animation

    gettimeofday (&last_idle_time, NULL);

    
    //[mouse center];
    
    if ([window isFullscreen]) {
        [observer toggleFocus];
        glutSetCursor(GLUT_CURSOR_NONE);
        [observer calibrateView:0 vert:0];//observer->getMouse().x,observer->getMouse().y);
        [observer mouse2view:0 y:0];
    }
    glutMainLoop ();
    return 0;
}



/*

//using namespace World;
//World world = World();
int main (int argc, char **argv) {
    
    
    //glutInitDisplayMode( GLUT_SINGLE );//GLUT_RGBA | GLUT_DEPTH | GLUT_DOUBLE );
    
    //glutMainLoop(); // Enter GLUT's main loop
    
    return 0;
    
}

*/
void debug(){
    [observer.item debug];
    [observer debug];
    [rmxDebugger feedback];
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        rmxDebugger = [[RMXDebugger alloc]init];
        world = [RMXArt initializeTestingEnvironment:nil];
        art = [[RMXArt alloc]initWithName:@"Art" parent:world world:world];
        observer = world.observer;
        window = [[RMXWindow alloc]initWithName:@"RMX Window" parent:world world:world];
        
        glutInit(&argc, argv);
        
        init();
    }
    return 0;
}
