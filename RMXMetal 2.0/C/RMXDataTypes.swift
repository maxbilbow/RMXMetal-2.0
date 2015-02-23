

//
//  RMXUserInterface.swift
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//


struct RMXPhysicsBody
{
    
    var position: RMXVector3
    var velocity: RMXVector3
    var acceleration: RMXVector3
    var forces: RMXVector3
    
    var  orientation: RMXMatrix4
    var vMatrix:RMXMatrix3
    var angles: RMXVector2
    
    var radius: Float
    var mass: Float
    var dragC: Float
    var dragArea: Float
    
}


