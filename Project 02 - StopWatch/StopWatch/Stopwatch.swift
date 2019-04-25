//
//  File.swift
//  StopWatch
//
//  Created by woong on 22/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation

class Stopwatch: NSObject {
    
    var timer: Timer
    var counter: Double
    
    override init() {
        timer = Timer()
        counter = 0.0
        
    }
}
