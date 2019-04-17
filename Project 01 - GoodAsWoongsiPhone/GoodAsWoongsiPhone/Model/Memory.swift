//
//  Memory.swift
//  GoodAsWoongsiPhone
//
//  Created by woong on 05/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation

class Memory {
    var memory: String?
    var memoryImageName: String?
    var fullScreenImageName: String?
    
    init(memory: String, memoryImageName: String, fullScreenImageName: String) {
        self.memory = memory
        self.memoryImageName = memoryImageName
        self.fullScreenImageName = fullScreenImageName
    }
}
