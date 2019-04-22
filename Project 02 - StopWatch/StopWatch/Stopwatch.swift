//
//  File.swift
//  StopWatch
//
//  Created by woong on 22/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation

class Stopwatch {
    
    private var startTime: NSDate?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
}
