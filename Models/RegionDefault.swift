//
//  RegionDefault.swift
//  Maps
//
//  Created by Caleb Ras on 3/13/22.
//

import Foundation
import MapKit
import SwiftUI


// MKCoordinateRegion default
enum RegionDefault {
    
    // Sacred Falls State Park, Oahu HI
    static let name = "Sacred Falls"
    static let description = "Sacred Falls State Park is a closed state park \nlocated in Hauʻula on the North Shore of the \nHawaiian island of Oʻahu."
    
    static let lat = 21.5770559
    static let long = -157.9143476
    
    static let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    static let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    static let region = MKCoordinateRegion(center: coordinate,
                                            span: span)
    
    static var point = PointOfInterest(name: name, lat: lat, long: long, description: description)
}
