//
//  LocationStorage.swift
//  FindMyLocation
//
//  Created by woong on 17/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation

class LocationStorage {
    static let shared = LocationStorage()
    
    private let fileManager: FileManager
    private let documentsURL: URL
    let locations: [Location]
    
    init() {
        fileManager = FileManager.default
        documentsURL = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        locations = []

    }
    
    
}
