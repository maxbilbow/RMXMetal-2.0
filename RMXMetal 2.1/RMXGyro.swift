//
//  RMXGyro.swift
//  OC to Swift oGL
//
//  Created by Max Bilbow on 17/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

//import Foundation
import CoreMotion


class RMXGyro : CMMotionManager, _RMXGyro {
    var hRotation:Float = 0.0   //Horizontal angle
    var vRotation:Float = 0.0   //Vertical rotation angle of the camera
    var cameraMovementSpeed:Float = 0.02
    var gameView: RMXGameView?
    var world: RMXWorld?


    required init(gameView: RMXGameView?){//, coder aDecoder: NSCoder?) {
        //fatalError("init(coder:) has not been implemented")
        
        self.gameView = gameView
        world = gameView?.world
        super.init()
        
        self.startAccelerometerUpdates()
        self.startDeviceMotionUpdates()
        
    }

    
    

    
    func Update() {
//        hRotation -= Input.acceleration.y * cameraMovementSpeed
//        vRotation += Input.acceleration.x * cameraMovementSpeed
        //transform.rotation = Quaternion.Euler(vRotation, hRotation, 0.0)
        
    }
    
    
    func interpretAccelerometerDataFor(particle: RMXParticle) {
        if (particle.effectedByAccelerometer) {
            var vector: [Float] = [ 0, 0, 0];
            if self.deviceMotion != nil {
                //particle.physics.description
                vector = [ -Float(self.accelerometerData!.acceleration.x),
                    -Float(self.accelerometerData!.acceleration.y),
                    -Float(self.accelerometerData!.acceleration.z)]
                //TODO: set to particle                 
                //particle.body.orientation =
                    particle.accelerateForward(vector[0])
                    particle.accelerateLeft(vector[1])
                
                NSLog("--- Accelerometer Data")
                NSLog("Motion: x\(self.deviceMotion!.userAcceleration.x.toData()), y\(self.deviceMotion!.userAcceleration.y.toData()), z\(self.deviceMotion!.userAcceleration.z.toData())")
            }
            if self.accelerometerData? != nil {
                let dp = "04.1"
                NSLog("Acceleration: x\(self.accelerometerData!.acceleration.x.toData()), y\(self.accelerometerData!.acceleration.y.toData()), z\(self.accelerometerData!.acceleration.z.toData())")
                NSLog("=> upVector: x\(vector[0].toData(dp: dp)), y\(vector[1].toData(dp: dp)), z\(vector[2].toData(dp: dp))")
            }
            //NSLog(particle.describePosition())
        }
    }
    
    
    func interpretAccelerometerData(){
        if deviceMotion != nil {
//            (parent! as Particle).upVector[0] = -Float(self.accelerometerData!.acceleration.x)
//            (parent! as Particle).upVector[1] = -Float(self.accelerometerData!.acceleration.y)
//            (parent! as Particle).upVector[2] = -Float(self.accelerometerData!.acceleration.z)
            
            
        RMXLog(self, "--- Accelerometer Data")
        RMXLog(self,"Motion: x\(self.deviceMotion!.userAcceleration.x.toData()), y\(self.deviceMotion!.userAcceleration.y.toData()), z\(self.deviceMotion!.userAcceleration.z.toData())")
        }
        if self.accelerometerData? != nil {
            let dp = "04.1"
            RMXLog(self,"Acceleration: x\(self.accelerometerData!.acceleration.x.toData()), y\(self.accelerometerData!.acceleration.y.toData()), z\(self.accelerometerData!.acceleration.z.toData())")
        //    RMXLog("=> upVector: x\((parent! as RMXSprite).upVector[0].toData(dp: dp)), y\((parent! as RMXSprite).upVector[1].toData(dp: dp)), z\((parent! as RMXSprite).upVector[2].toData(dp: dp))")
        }
        else {
         RMXLog(self,"No motion?!")
        }
    }
        
//        if (self.attitude? != nil){// && (self.attitude?.rotationMatrix != nil) {
//            println("Roll: \(self.attitude!.roll)\n Pitch\(self.attitude!.pitch), Yaw\(self.attitude!.yaw)")
//        }
    
    /*
        func setOrientation(orientation: SCNVector3)
        {
            //NSLog(@"%s %@", __PRETTY_FUNCTION__, orientation);
            var x = orientation.x / 9.8
            var y = orientation.y / 9.8
            var z = orientation.z / 9.8
            if (x == 0.0 || y == 0.0 || z == 0.0) { return }
            
            var roll = -atan2f(y, z)
            var pitch = atan2f(x, sqrtf(y*y + z*z))
            
            var transform: CATransform3D = CATransform3DMakeRotation(CGFloat(deviceMotion.attitude!.roll), CGFloat(0.0), CGFloat(0.0), CGFloat(1.0))
            transform = CATransform3DRotate(transform, CGFloat(pitch),CGFloat(1.0), CGFloat(0.0), CGFloat(1.0))
            //self.parent?.worldView//.transform = transform
        }
*/

}






