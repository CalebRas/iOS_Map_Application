//
//  MapsView.swift
//  Maps
//
//  Created by Caleb Ras on 3/11/22.
//

import SwiftUI
import MapKit


// Map view used for background, has location follow if enables
struct MapsView: View {
    
    // Member variables
    @Binding var region: MKCoordinateRegion
    @Binding var markers: Array<PointOfInterest>
    @Binding var locationOn: Bool       // location follow
    
    @StateObject private var location = LocationManager()
    
    // View body
    var body: some View {
        
        // Map without location follow, default
        if locationOn == false {
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                showsUserLocation: true,
                annotationItems: markers) { point in
                    MapMarker(coordinate: point.coordinate)
                }
                .onAppear {
                    location.checkServices()
                }
                .accentColor(Color(.systemGray))
                .ignoresSafeArea()
        }
        
        // Map with location follow
        else {
        Map(coordinateRegion: $region,
            interactionModes: [.all],
            showsUserLocation: true,
            userTrackingMode: .constant( .follow),
            annotationItems: markers) {point in
                MapMarker(coordinate: point.coordinate)
            }
            .onAppear {
                location.checkServices()
                region = location.region
            }
            .ignoresSafeArea()
        }
    }
}

