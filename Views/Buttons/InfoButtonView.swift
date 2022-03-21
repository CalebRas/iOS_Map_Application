//
//  InfoButtonView.swift
//  Maps
//
//  Created by Caleb Ras on 3/14/22.
//

import SwiftUI
import MapKit


// A button that brings up a sheet with info on the closest point
struct InfoButtonView: View {
    
    // Member variables
    @Binding var region: MKCoordinateRegion
    @Binding var markers: Array<PointOfInterest>
    
    @State private var sheetOn: Bool = false
    
    // View body
    var body: some View {
        
        // Info button, turns on sheet
        Button {
            sheetOn = true

        } label: {
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 25.0, height: 25.0)
        }
        .frame(width: 50, height: 50, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 7)
                        .fill(Color.white))
        .shadow(radius: 3)
        .position(x: 371, y: 640)
        .sheet(isPresented: $sheetOn) { PointSheetView(region: $region, markers: $markers, sheetOn: $sheetOn, point: getClosestPoint())}
    }
    
    
    // Finds the marker closest to current region and sets to closestPoint
    private func getClosestPoint() -> PointOfInterest {
        
        // Starting distance
        var closestPoint = markers[0]
        var currentLoc = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
        var pointLoc = CLLocation(latitude: closestPoint.lat, longitude: closestPoint.long)
        var smallestDistance = currentLoc.distance(from: pointLoc)
        
        // Computes and compares each points distance from current region
        for point in markers {
            currentLoc = CLLocation(latitude: region.center.latitude,
                                     longitude: region.center.longitude)
            pointLoc = CLLocation(latitude: point.lat,
                                        longitude: point.long)
            let pointDistance = currentLoc.distance(from: pointLoc)
            
            // If current point is closer
            if pointDistance < smallestDistance {
                smallestDistance = pointDistance
                closestPoint = point
            }
        }
        
        return closestPoint
    }
}


