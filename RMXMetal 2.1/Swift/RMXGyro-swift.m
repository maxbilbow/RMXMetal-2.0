//
//  RMXGyro-swift.m
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//


#include "RMXStandardLib.h"

@implementation RMXGyro

@synthesize gameView = _gameView, world = _world, hRotation = _hRotation, vRotation = _vRotation, cameraMovementSpeed = _cameraMovementSpeed;

- (id)initWithGameView:(RMXGameView*)gameView {
    self = [super init];
    _hRotation = _vRotation = 0.0;
    _cameraMovementSpeed = 0.02;
    _gameView = gameView;
    _world = nil;//gameView.world;
   
    [self startAccelerometerUpdates];
    [self startDeviceMotionUpdates];
    return self;
    
    }
    

    
    
    - (void)Update {
        //        hRotation -= Input.acceleration.y * cameraMovementSpeed
        //        vRotation += Input.acceleration.x * cameraMovementSpeed
        //transform.rotation = Quaternion.Euler(vRotation, hRotation, 0.0)
        
        
    }
    
- (void)interpretAccelerometerData{
    
}
- (void)interpretAccelerometerDataFor:(RMXParticle*)particle {
        NSLog(@"Needs overriding");
       /* if (particle.effectedByAccelerometer) {
            var vector: [Float] = [ 0, 0, 0];
            if self.deviceMotion != nil {
                
                vector = [ -Float(self.accelerometerData!.acceleration.x),
                          -Float(self.accelerometerData!.acceleration.y),
                          -Float(self.accelerometerData!.acceleration.z)]
                //TODO: set to particle
                //particle.body.orientation =
                
                
                RMXLog("--- Accelerometer Data")
                RMXLog("Motion: x\(self.deviceMotion!.userAcceleration.x.toData()), y\(self.deviceMotion!.userAcceleration.y.toData()), z\(self.deviceMotion!.userAcceleration.z.toData())")
            }
            if self.accelerometerData? != nil {
                let dp = "04.1"
                RMXLog("Acceleration: x\(self.accelerometerData!.acceleration.x.toData()), y\(self.accelerometerData!.acceleration.y.toData()), z\(self.accelerometerData!.acceleration.z.toData())")
                RMXLog("=> upVector: x\(vector[0].toData(dp: dp)), y\(vector[1].toData(dp: dp)), z\(vector[2].toData(dp: dp))")
            }
            RMXLog(particle.describePosition())
        } */
    }

    
@end
