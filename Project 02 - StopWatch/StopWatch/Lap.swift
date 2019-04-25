//
//  Lap.swift
//  StopWatch
//
//  Created by woong on 23/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation

class Lap {
    var lapNumber: Int
    var lapTime: String
    
    init(lapNumber: Int, lapTime: String) {
        self.lapNumber = lapNumber
        self.lapTime = lapTime
    }
}
