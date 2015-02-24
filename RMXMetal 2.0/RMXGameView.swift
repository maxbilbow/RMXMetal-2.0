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
    var parent: RMXObject? = nil
    var world: RMXMetalWorld? = nil
    var physics: RMXPhysics? = nil
    var gameView: RMXGameView? = nil
    var observer: RMXMetalMan? = nil
    var name: String = "Yo!"
    var gyro: RMXGyro? = nil

    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        parent = nil
        self.gyro = RMXGyro(gameView: self)
        gameView = self
        self.observer = RMXMetalMan()
        
        world = RMXMetalWorld(UI: self)
        
        
        //Add Gesture Recognisers
        //rmxDebugger = RMXDebugger()
        let w = self.view.bounds.size.width
        let h = self.view.bounds.size.height
        
        
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
        //self.observer!.animate()
        world?.animate()
        self.gyro!.interpretAccelerometerDataFor(observer!)
        //RMX.printLog();
       // NSLog("UPDATE")
        //if self.world!.observer.name != nil {
            metalLayer.sublayerTransform = self.observer!.matrixView
        //}
    }
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        self.world!.reInit();
        
        NSLog("Double Tap \n \(observer!.describePosition())")
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
        let x: Float = Float(location.x)
        let y: Float = -Float(location.y)
        self.world!.observer.accelerateForward(y);
        self.world!.observer.accelerateLeft(x)
        RMXLog("--- Left Pan: \(location.x), \(location.y)");
    }
    
    
    //The event handling method
    func handlePanRightSide(recognizer: UIPanGestureRecognizer) {
        var location:CGPoint = recognizer.velocityInView(self.view);
        let x: Float = Float(location.x)
        let y: Float = -Float(location.y)
        self.observer!.plusAngle(x, up:y);
        RMXLog("--- Right Pan: \(location.x), \(location.y)");
    }

}