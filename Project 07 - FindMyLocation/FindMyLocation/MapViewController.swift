//
//  ViewController.swift
//  FindMyLocation
//
//  Created by woong on 13/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    var previousLocation: CLLocation?
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.mapType = .standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        
        return map
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        
        return label
    }()
    
    let pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mapPin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(mapView)
        mapView.addSubview(locationLabel)
        mapView.addSubview(pinImageView)
        
        checkLocationServices()
        
//        mapView.showsUserLocation = true
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            
            locationLabel.leftAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.leftAnchor, constant: 0),
            locationLabel.rightAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.rightAnchor, constant: 0),
            locationLabel.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            locationLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pinImageView.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            pinImageView.centerYAnchor.constraint(equalTo: mapView.centerYAnchor, constant: -20),
            ])
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        mapView.delegate = self
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            
            setupLocationManager()
            checkLocationAuthorization()
            
            
            
        } else {
            print("Please turn on location service or GPS")
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissionss
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedAlways:
            break
        default:
            break
        }
    }
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
        
    }

}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error: \(error)")
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placeMarks, error) in
            guard let self = self else { return }
            
            guard let previousLocation = self.previousLocation else { return }
            guard center.distance(from: previousLocation) > 50 else { return }
            self.previousLocation = center
            
            if let _ = error {
                // TODO: Show alert informingthe user
                return
            }
            
            guard let placeMark = placeMarks?.first else {
                // TODO: Show alert informingthe user
                return
            }
            
            let streetNumber = placeMark.subThoroughfare ?? "" // 번지
            let streetName = placeMark.thoroughfare ?? "" // 도로명
            let countryName = placeMark.country ?? "" // 나라
            let localName = placeMark.locality ?? "" // 구
            let subLocalName = placeMark.subLocality ?? ""
            let name = placeMark.name ?? "" // 도로명 + 번지
            
            DispatchQueue.main.async {
                let location = "\(countryName) \(localName) \(streetName) \(streetNumber) "
                self.locationLabel.text = location
            }
        }
        
    }
}
