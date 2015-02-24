//
//  RMXWorld.h
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef RMXMetal_2_0_RMXWorld_h
#define RMXMetal_2_0_RMXWorld_h


#endif

#define W_GRAVITY (0.01/50);
#define W_FRICTION 1.1;


#define VIEWING_DISTANCE_MIN  3.0
#define TEXTURE_ID_CUBE 1



@interface RMXWorld : RMXPhysics 
@property NSMutableArray* sprites;
@property NSString* observerName;
@property (readonly)RMXObserver* observer;
@property float dt;
- (id)initWithUI:(RMXGameView*)view;
- (RMXObject*)closestObjectTo:(RMXParticle*)sender;
- (void)animate;
- (void)insertSprite:(RMXParticle*)sprite;
- (id)objectWithName:(NSString*)name;
- (void)setObserverWithId:(RMXParticle*)object;
- (void)resetWorld;
- (float)µAt:(RMXParticle*)someBody;
- (float)massDensityAt:(RMXParticle*)someBody;
- (float)normalForceAt:(RMXParticle*)someBody;
- (bool)collisionTest:(RMXParticle*)sender;
- (void)applyGravity:(BOOL)hasGrav;
@end


