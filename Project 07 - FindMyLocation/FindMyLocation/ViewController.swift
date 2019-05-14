//
//  ViewController.swift
//  FindMyLocation
//
//  Created by woong on 13/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
//        view.addSubview(mapView)
//
//        NSLayoutConstraint.activate([
//            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//            mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
//            mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0)
//            ])
    }


}

