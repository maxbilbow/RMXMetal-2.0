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

//@interface KeyProcessor : NSEvent <RMXObject>
//@property bool* keyStates, *keySpecialStates;
//@property char forward, back, left, right, up, down, stop, jump;
//@end
//@implementation KeyProcessor

//@synthesize name = _name;

struct KeyProcessor {
//bool* keyStates, *keySpecialStates;
    char forward, back, left, right, up, down, stop, jump;
    bool update;
    bool keyStates[256], keySpecialStates[246];// = new bool[246];

//- (id)initWithName:(NSString*)name
//
//    {
//    _name = name;
//    self = [super init];
//        forward = 'w';
//        back = 's';
//        left = 'a';
//        right = 'd';
//        up = 'e';
//        down = 'q';
//        stop = 'f';
//        jump = 32;
//        keyStates = new bool[256];
//        keySpecialStates = new bool[246];
//        update = true;
//        glutSetKeyRepeat(false);
//    }
    
};
//@end


static struct KeyProcessor keys;// = KeyProcessor();

void initKeys(){
    keys.forward = 'w';
    keys.back = 's',
    keys.left = 'a',
    keys.right = 'd',
    keys.up = 'e',
    keys.down = 'q',
    keys.stop = 'f',
    keys.jump = 32;
    //bool * keyStates[256], * keySpecialStates[246]
}


void repeatedKeys(){
    
#if TARGET_OS_IPHONE
#else
    if (keys.keySpecialStates[GLUT_KEY_UP]) {
        if (keys.keyStates[9])
            return;//[sun lightUp:1];
        else
            [observer extendArmLength:1];

    } else if(keys.keySpecialStates[GLUT_KEY_DOWN]) {
        if (keys.keyStates[9]) {
            return;//[sun lightUp:-1];
        } else {
            [observer extendArmLength:-1];
        }
    }
#endif
}

void movement(float speed, int key){
    //if (keys.keyStates[keys.forward])  [observer accelerateForward:speed];
    if (key == keys.forward) {
        if (!speed)
            [observer forwardStop];
        else
            [observer accelerateForward:speed];
    }
    
    if (key == keys.back) {
        if (!speed)
            [observer forwardStop];
        else
            [observer accelerateForward:-speed];
        //TODO
    }
    
    if (key == keys.left) {
        if (!speed)
            [observer leftStop];
        else
            [observer accelerateLeft:speed];
        //if(test) cout << keys.left << " ";
    }
    
    if (key == keys.right) {
        if (!speed)
             [observer leftStop];
        else
            [observer accelerateLeft:-speed];
        //if(test) cout << keys.right << " ";
        //TODO
    }
    
    if (key == keys.up) {
        if (!speed)
             [observer upStop];
        else
             [observer accelerateUp:speed];
        //if(test) cout << keys.up << " ";
        //TODO
    }
    
    if (key == keys.down) {
        if (!speed)
             [observer upStop];
        else
             [observer accelerateUp:-speed];
        //if(test) cout << keys.down << " ";
        //TODO
    }
    if (key == 32) {
        if (speed==0)
             [observer jump];
        else
             [observer prepareToJump];
    //TODO
    }

}

void keyDownOperations (int key) {
    bool test = true;
    movement((float)1.0, key);
    if(key =='y') {
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:y unassigned",key]];
    }
    if (key =='z') {
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:z unassigned",key]];
    }
    if (key =='x') {
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:x unassigned",key]];
    }
    
    if (keys.keyStates['=']) {
        if (keys.keyStates['r'])
            art.r += 0.05;
        if (keys.keyStates['g'])
            art.g += 0.05;
        if (keys.keyStates['b'])
            art.b += 0.05;
        if (keys.keyStates['k'])
            art.k += 0.05;
            
    } else if (keys.keyStates['-']) {
        if (keys.keyStates['r'])
            art.r -= 0.05;
        if (keys.keyStates['g'])
            art.g -= 0.05;
        if (keys.keyStates['b'])
            art.b -= 0.05;
        if (keys.keyStates['k'])
            art.k -= 0.05;
    }
    //if (keys.keySpecialStates[])
    
}

//template <typename Particle>
void keyUpOperations(int key){
    movement((bool)false, key); //Change to Zero if maintaining velocity
    if (key == 'i'){
        NSLog(@"%@",observer.viewDescription);//me.toString();
    }
    
    switch (key)
    {
        default:
            [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i unassigned",key]];
            break;
        case 27:             // ESCAPE key
            //glutSetKeyRepeat(true);
            exit (0);
            break;
        case 'l':
            SelectFromMenu(MENU_LIGHTING);
            break;
        case 'p':
            SelectFromMenu(MENU_POLYMODE);
            break;
        case 't':
            SelectFromMenu(MENU_TEXTURING);
            break;
        case 'z':
            [world applyGravity:YES];
            break;
        case 'Z':
            [world applyGravity:NO];
            break;
        case 'm':
             [observer toggleFocus];
            NSLog(@"m");
            if ( [observer hasFocus]){
                //center();
                glutSetCursor(GLUT_CURSOR_NONE);
               
                [observer calibrateView:0 vert:0];// [observer getMouse().x, [observer getMouse().y);
                [observer mouse2view:0 y:0];
                //glutWarpPointer(0,0);
                
            }
            else {
                glutSetCursor(GLUT_CURSOR_INHERIT);
            }
            break;
        case 32:
    // [observer stop();
            [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i: Space Bar",key]];
            break;
        case 9:
            // [observer stop();
            [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i: TAB",key]];
            break;
        case 'G':
             [observer toggleGravity];
            break;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            exit(0);//[sun lightSwitch:key];
            break;
        case 'S':
           // sun.setAnchor(&observer);
            break;
        case 'R':
            [world resetWorld];
            break;
        case 6: //cntrl f
            NSLog(@"ERROR: Toggle Full Screen not working");//[window toggleFullScreen];
            break;
    }
   // keys.keyStates[key] = false;
    
}
void keySpecialDownOperations(int key) {
    if (key == GLUT_KEY_UP) { // If the left arrow key has been pressed
        //me.look(Observer::UP);
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:UP Pressed",key]];
        //TODO
    }
    
    if (key == GLUT_KEY_DOWN) {
        //me.look(Observer::DOWN);
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:DOWN Pressed",key]];
        //TODO
    }
    
    if (key == GLUT_KEY_LEFT) {
        //me.look(Observer::LEFT);
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:LEFT Pressed",key]];
        //TODO
    }
    
    if (key == GLUT_KEY_RIGHT) {
        //me.look(Observer::RIGHT);
        [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i:RIGHT Pressed",key]];
        //TODO
    }
    
    
    // Perform 'a' key operations
    
}


void keySpecialUpOperations(char key) {
    switch (key){
        case GLUT_KEY_LEFT:
            [rmxDebugger cycle:-1];
            break;
        case GLUT_KEY_RIGHT:
            [rmxDebugger cycle:1];
            break;
        case GLUT_KEY_UP:
            //[[observer item]lightUp:10];
            break;
        case GLUT_KEY_DOWN:
            //[[observer item]lightUp:-10];
            break;
        case 32:
            // [observer stop();
            [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i: SPACE BAR Released",key]];
            break;

    }
}




void keySpecialOperations(void) {
    keys.update=true;
    //keySpecialDownOperations();
}

void RMXkeyPressed (unsigned char key, int x, int y) {
    //char kTemp = key;
    //NSString * tmp = [NSString stringWithFormat:@"%c",key];//&kTemp;
    [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%c: pressed",key]];
    keys.keyStates[key] = true; // Set the state of the current key to pressed
    keyDownOperations(key);
}

void RMXkeyUp (unsigned char key, int x, int y) {
    //string tmp = to_string(key);
    [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%c: released",key]];
    keyUpOperations(key);
    keys.keyStates[key] = false; // Set the state of the current key to not pressed
}
void RMXkeySpecial (int key, int x, int y) {
    [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i: pressed (special)",key]];
    keys.keySpecialStates[key] = true; // Set the state of the current key to pressed
    keySpecialDownOperations(key);
}

void RMXkeySpecialUp (int key, int x, int y) {
    [rmxDebugger add:RMX_KEY_PROCESSOR n:@"KeyProcessor" t:[NSString stringWithFormat:@"%i: released (special)",key]];
    keySpecialUpOperations(key);
    keys.keySpecialStates[key] = false; // Set the state of the current key to not pressed
    
}
