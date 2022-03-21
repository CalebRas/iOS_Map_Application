//
//  CoordinatesTextView.swift
//  Maps
//
//  Created by Caleb Ras on 3/13/22.
//

import SwiftUI
import MapKit


// View for coordinates of current region
// Displayed in the left bottom corner
struct CoordinatesTextView: View {
    
    // Region
    @Binding var region: MKCoordinateRegion

    // View body
    var body: some View {
    
        // Latitude coordinates
        Text("Lat: ")
            .font(.system(size: 13))
            .position(x: 22, y: 755)
        
        let latStr = String(format: "%.6f", region.center.latitude)
        Text(latStr)
            .font(.system(size: 13))
            .position(x: 65, y: 755)
            
            
        // Longitude coordinates
        Text("Long: ")
            .font(.system(size: 13))
            .position(x: 28, y: 770)
        
        let longStr = String(format: "%.6f", region.center.longitude)
        Text(longStr)
            .font(.system(size: 13))
            .position(x: 81, y: 770)
    }
}

