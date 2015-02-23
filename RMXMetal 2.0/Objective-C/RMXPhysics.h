//
//  RMXPhysics.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXPhysics_h
#define RMXMetal_2_0_RMXPhysics_h


#endif


//@class Particle, RMXObject;

@interface RMXPhysics : RMXObject
@property float gravity;

@property (readonly) GLKVector3 gVector;
- (RMXVector3)gravityFor:(RMXParticle*)sender;
- (RMXVector3)frictionFor:(RMXParticle*)sender;
- (RMXVector3)normalFor:(RMXParticle*)sender;
- (RMXVector3)dragFor:(RMXParticle*)sender;
@end

