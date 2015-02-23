//
//  Physics.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 25/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//



#import "RMXStandardLib.h"

@implementation RMXPhysics

@synthesize gravity = _gravity;//, hasFriction = _hasFriction, hasGravity = _hasGravity;
- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world
{
    self = [super initWithName:name parent:parent world:world];
    if (self) {
        _gravity = 0.098;//U_GRAVITY;
        NSLog(@"init Physics");
    }
    return self;
}


- (void)applyGravityTo:(RMXParticle*)particle{
    NSLog(@"Probably should delete this: (void)applyGravityTo:(Particle*)particle");
    exit(0);
   
}
- (GLKVector3)gVector:(BOOL)hasGravity {
    return GLKVector3MultiplyScalar(self.upVector,(hasGravity)?-_gravity:0);
}



- (void)debug {
    [rmxDebugger add:RMX_PHYSICS n:self t:[NSString stringWithFormat:@"%@ debug not set up",self.name]];
}



- (GLKVector3)gravityFor:(RMXParticle*)sender {
    return GLKVector3MultiplyScalar(self.upVector,-sender.weight);
}



- (GLKVector3)dragFor:(RMXParticle*)sender{
    float dragC = sender->body.dragC;
    float rho = 0.005;
    float u = RMXGetSpeed(sender->body.velocity);// RMXScaler3FromMatrix3(body.vMatrix);
    float area = sender->body.dragArea;//PI * sender->body.radius * sender->body.radius;
    GLKVector3 v;
    //for (int i = 0;i<3;++i){
        v.v[0] = 0.5 * rho * u*u * dragC * area;
   // }
    
    return v;
}

- (GLKVector3)frictionFor:(RMXParticle*)sender {
    float µ = [self.world µAt:sender];
    
    
    
    return RMXMatrix3MultiplyScalarAndSpeed(sender->body.vMatrix,µ); //RMXVector3Add4(GLKVector3Make(0,0,0),µX,µY,µZ);
}

- (RMXVector3)normalFor:(RMXParticle*)sender{
    float normal = [self.world normalForceAt:sender];
    return GLKVector3MultiplyScalar(self.upVector,normal);// : GLKVector3Make(0,0,0);
}

@end;