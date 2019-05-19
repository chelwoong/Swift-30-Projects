//
//  Location.swift
//  FindMyLocation
//
//  Created by woong on 17/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import Foundation
import CoreLocation

class Location: Codable {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter
    }()
    
    let latitude: Double
    let longitude: Double
    let date: Date
    let dateString: String
    let description: String

}
