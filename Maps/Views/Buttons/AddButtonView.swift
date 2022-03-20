//
//  AddButtonView.swift
//  Maps
//
//  Created by Caleb Ras on 3/13/22.
//

import SwiftUI
import MapKit


// View for button used to add a marker
struct AddButtonView: View {
    
    // Region and markers
    @Binding var region: MKCoordinateRegion
    @Binding var markers: Array<PointOfInterest>
    
    // View body
    var body: some View {
        
        // Location button, adds point to markers list
        Button {
            addMarker()
        }
        
        label: {
            Image(systemName: "plus")
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
        }
        .frame(width: 50, height: 50, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 7)
                        .fill(Color.white))
        .shadow(radius: 3)
        .position(x: 371, y: 695)
    }
    
    
    // Adds marker with current location of region
    private func addMarker() {
        let lat = region.center.latitude
        let long = region.center.longitude
        
        let marker = PointOfInterest(name: "", lat: lat, long: long)
        var markersCopy = markers

        markersCopy.append(marker)
        markers = markersCopy
    }
}


