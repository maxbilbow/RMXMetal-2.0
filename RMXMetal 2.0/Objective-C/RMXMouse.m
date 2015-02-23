//
//  Mouse.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 31/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

/*
 
 * AKA Mouse
 
 */



#include "RMXStandardLib.h"

@implementation RMXMouse 


@synthesize dx, dy, pos, focus, dPad = _dPad;

- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world
{
    self = [super initWithName:name parent:parent world:world];
    focus = false;
    dx = 0;
    dy = 0;
    pos = GLKVector2Make(0,0);
    
    return self;
}


- (void)toggleFocus
{
    focus = !focus;
}

    
    
- (GLKVector2)getMouse
{

    return pos;
}

- (void)centerView:(void(int x, int y))center
{
    center(pos.x,pos.y);
}
- (void)setMousePos:(int)x y:(int)y
{
    pos.x = x;// + dx;
    pos.y = y;//;
}
- (void)mouse2view:(int)x y:(int)y{
    NSLog(@"ERROR: Mouse2View Called directly to Mouse!");
}

- (void)mouse2view:(int)x y:(int)y owner:(id)owner
{
        //dx = dy = 0;
        
        
        int DeltaX, DeltaY;// =
        
#if TARGET_OS_IPHONE
#else
    CGGetLastMouseDelta(&DeltaX, &DeltaY);
#endif
    
    
    [rmxDebugger add:RMX_MOUSE n:self t:[NSString stringWithFormat:@"Mousie diffX: %i, diffY: %i",DeltaX, DeltaY]];
       
        int dir = focus ? 1 : -1;
        
        float theta = (float)(DeltaX)*dir;
        float phi = (float)(DeltaY)*dir;// / 20.0f;
        
    [owner plusAngle:theta up:phi];
    
        
    }
    
- (void)calibrateView:(int)x vert:(int)y
{
#if TARGET_OS_IPHONE
#else
    CGGetLastMouseDelta(&dx, &dy);
#endif
}

- (void)debug {
    [rmxDebugger add:RMX_MOUSE n:self t:[NSString stringWithFormat:@"%@ debug not set up",self.name]];
}
@end