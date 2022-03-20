//
//  PointInfoView.swift
//  Maps
//
//  Created by Caleb Ras on 3/16/22.
//

import SwiftUI
import MapKit


// Displays the info for a given point
struct PointInfoView: View {
    
    // Region and single point
    @Binding var region: MKCoordinateRegion
    @Binding var point: PointOfInterest
    
    // View Body
    var body: some View {
        ZStack {
            // Header name or point
            Text(getNameText())
                .font(.system(size: 37))
                .position(x: 207, y: 50)
            
            
            // Cooridnate display
            Text("Coordinates: ")
                .font(.system(size: 20))
                .position(x: 73, y: 100)
            
            // Lat
            let latText = "Lat: \(String(format: "%.6f", point.lat))"
            Text(latText)
                .font(.system(size: 16))
                .position(x: 93, y: 125)

            
            // Long
            let longText = "Long: \(String(format: "%.6f", point.long))"
            Text(longText)
                .font(.system(size: 16))
                .position(x: 107, y: 145)

            
            // Description
            Text("Description: ")
                .font(.system(size: 20))
                .position(x: 72, y: 200)
            
            Text(getDescription())
                .font(.system(size: 16))
                .position(x: 205, y: 245)
        }
    }
    
    
    // Returns a point's name formatted, used for title
    private func getNameText() -> String {
        var nameText = point.name
        
        // Set name to lat and long if there is no name in point
        if point.name == "" { nameText = "Point of Interest" }
        
        return nameText
    }
    
    
    // Returns a point's description
    private func getDescription() -> String {
        var descText = point.description
        
        // Set to no data if there is none
        if point.description == "" { descText  = "No data to display" }
        
        return descText
    }
}

