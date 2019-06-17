//
//  LocationManager.swift
//  JingMY_Swift
//
//  Created by jing_mac on 2019/6/14.
//  Copyright © 2019 jing_mac. All rights reserved.
//

import UIKit
import MapKit

class LocationManager: NSObject {
    let locationManager = CLLocationManager()
    var locationPointArray:[CLLocation] = []
    
    override init() {
        super.init()
        initLocationManager()
    }
    
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.activityType = .otherNavigation
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
}


//MARK:-CLLocationManagerDelegate
extension LocationManager:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
}
