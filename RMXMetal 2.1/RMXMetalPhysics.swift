//
//  RMXMetalPhysics.swift
//  RMXMetal 2.0
//
//  Created by Max Bilbow on 23/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation

class RMXMetalPhysics : RMXPhysics {
    //var upVector: [Float]
    
    required override init(name: String?, parent: RMXObject?, world: RMXWorld?) {
        NSLog("\(name) , \(parent), \(world)")
        super.init(name: "Physics", parent: nil , world: world)
        gravity = 0.098
        
    }
}