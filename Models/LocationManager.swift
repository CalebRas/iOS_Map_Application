//
//  LocationManager..swift
//  Maps
//
//  Created by Caleb Ras on 3/7/22.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI


// Class for handling CLLocationManager
final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Member variables
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: RegionDefault.coordinate,
                                                span: RegionDefault.span)
    
    // If location services is enabled, init locationManger
    func checkServices() {
        
        if CLLocationManager.locationServicesEnabled() == true {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self

        }
        else {
            print("Error: location services not enabled")
        }
    }
    
    
    // Handles the difference location authroiation cases
    private func checkAuthoriation() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        // Ask for authoriation
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        // Error
        case .restricted:
            print("Error; location is restricted")
            
        // Error
        case .denied:
            print("Error; location is deined")
            
        // Do nothing
        case .authorizedAlways, .authorizedWhenInUse:
            break
            
        // Error
        @unknown default:
            print("Error: unknown location authorization case")
        }
    }
    
    
    // If auhtorication changed, check auhtorization status
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthoriation()
    }
}
