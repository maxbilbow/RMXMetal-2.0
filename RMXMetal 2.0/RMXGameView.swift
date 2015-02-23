//
//  RMXUserInterface.swift
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//
//
import Foundation
import UIKit
import SceneKit


//let rmxDebugger:RMXDebugger = RMXDebugger()
class RMXGameView : GameViewController {
    
    lazy var world: RMXWorld? = RMXWorld(name: String("Brave New World"), parent: nil, world: nil)//RMXArt.initializeTestingEnvironment(self) //RMXWorld()
    //lazy var interface:RMXUserInterface = RMXUserInterface(gameView: self)

    lazy var gyro: RMXGyro?  = RMXGyro(gameView: self);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        world!.gameView = self;
        //Add Gesture Recognisers
        //rmxDebugger = RMXDebugger()
        let w = self.view.bounds.size.width
        let h = self.view.bounds.size.height
        
        //gyro = RMXGyro(gameView: self)
        var o: RMXObserver = world!.observer
        
        let leftView: UIView = UIImageView(frame: CGRectMake(0, 0, w/2, h))
        let lPan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self,action: "handlePanLeftSide:")
        leftView.addGestureRecognizer(lPan)
        leftView.userInteractionEnabled = true
        self.view.addSubview(leftView)
        
        let rightView: UIView = UIImageView(frame: CGRectMake(w/2, 0, w/2, h))
        let rPan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self,action: "handlePanRightSide:")
        rightView.addGestureRecognizer(rPan)
        
        rightView.userInteractionEnabled = true
        self.view.addSubview(rightView)
        
        
        let dt: UITapGestureRecognizer = UITapGestureRecognizer(target: self,  action: "handleDoubleTap:")
        dt.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(dt)
        
    }
    var i: Int = 0
    override func update() {
        super.update()
        gyro!.interpretAccelerometerData()
        RMX.printLog();
        
        if self.world!.observerName != nil {
          // world.observer
            
            
//            self.view.transform.a = CGFloat(i/100)
//            self.view.transform.b = CGFloat(i/100)
//            self.view.transform.c = CGFloat(i/100)
//            self.view.transform.d = CGFloat(i/100)
            self.view.transform.tx = CGFloat(i/100)
             self.view.transform.ty = CGFloat(i/100)
            ++i
           // self.view.pointOfView!.position = self.observer!.position
            //        cameraNode.position.x = self.observer()!.position[0]
            //        cameraNode.position.y = self.observer()!.position[1]
            //        cameraNode.position.z = self.observer()!.position[2]
            //cameraNode.position = (self.view as SCNView).pointOfView!.position
            //cameraNode.position.z += 15
            RMXLog("--- Camera Orientation")
           // RMXLog("w\(cameraNode.orientation.w.toData()), x\(cameraNode.orientation.w.toData()), y\(cameraNode.orientation.w.toData()), z\(cameraNode.orientation.w.toData())")
            //self.update()
        } else {
            RMXLog("--- Warning: observer may not be initialised")
        }

    }
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        self.world!.reInit();
        NSLog("Double Tap")
    }
    
    //The event handling method
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        //_world.observer stop];
        
    }
    
    //The event handling method
    func handleTwoFingerTap(recognizer: UITapGestureRecognizer) {
        recognizer.numberOfTouchesRequired = 2;
        //    _world.observer.stop();
    }
    
    
    
    //The event Le method
    func handlePanLeftSide(recognizer: UIPanGestureRecognizer) {
        var location:CGPoint = recognizer.velocityInView(self.view);
        let x: Float = Float(location.x)*0.01
        let y: Float = -Float(location.y)*0.01
        self.world!.observer.accelerateForward(y);
        self.world!.observer.accelerateLeft(x)
        RMXLog("Left Pan: \(location.x), \(location.y)");
    }
    
    
    //The event handling method
    func handlePanRightSide(recognizer: UIPanGestureRecognizer) {
        var location:CGPoint = recognizer.velocityInView(self.view);
        let x: Float = Float(location.x)
        let y: Float = -Float(location.y)
        self.world!.observer.plusAngle(x, up:y);
        RMXLog("Right Pan: \(location.x), \(location.y)");
    }

} 