//
//  MainScreenView.swift
//  Maps
//
//  Created by Caleb Ras on 3/11/22.
//

import SwiftUI
import MapKit


// View of the Main screen, containing a map, input fields for lat and long,
// and a user location toggle
struct MainScreenView: View {
    
    // Memeber variables
    @State private var locationOn = false
    @State private var region = RegionDefault.region
    @State private var markers = [ RegionDefault.point ]
    
    // View body
    var body: some View {
        ZStack {
            // Map background view
            MapsView(region: $region, markers: $markers, locationOn: $locationOn)
            
            // Cooridnate input boxes
            CoorsInputView(locationOn: $locationOn, region: $region)
            
            // Buttons
            InfoButtonView(region: $region, markers: $markers) // sheet
            AddButtonView(region: $region, markers: $markers)
            LocationButtonView(locationOn: $locationOn)
            
            // Coordinates display
            CoordinatesTextView(region: $region)
        }

    }
}


// Preview 
struct InputMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
