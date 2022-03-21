//
//  PointOfInterest.swift
//  Maps
//
//  Created by Caleb Ras on 3/13/22.
//

import Foundation
import MapKit


// Hold a point for a MapKit map
// Used for MapMarkers that are displayed
struct PointOfInterest: Identifiable {
    
    var id = UUID()
    
    var name: String
    var description: String = ""
    
    var lat: Double
    var long: Double
    
    var coordinate: CLLocationCoordinate2D
    
    // Create a coordinate from lat and long
    init(name: String, lat: Double, long: Double, description: String = "") {
        self.name = name
        
        self.lat = lat
        self.long = long
        self.coordinate = CLLocationCoordinate2D(latitude: lat,
                                                longitude: long)
        self.description = description
    }
}
