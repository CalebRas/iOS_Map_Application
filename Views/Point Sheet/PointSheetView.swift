//
//  PointSheetView.swift
//  Maps
//
//  Created by Caleb Ras on 3/14/22.
//

import SwiftUI
import MapKit


// View that displays the info of a point throw a sheet
struct PointSheetView: View {
    
    // Memeber variables
    @Binding var region: MKCoordinateRegion
    @Binding var markers: Array<PointOfInterest>
    @Binding var sheetOn: Bool
    
    @State var point: PointOfInterest
    
    // View body
    var body: some View {
        ZStack {
            
            // Drag handle, turns sheet off when pressed
            Button {
                sheetOn = false

            } label: {
                Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3)
                    .position(x: 207, y: 10)
            }
            
            // Point info, at the top of sheet
            PointInfoView(region: $region, point: $point)
            
            // Edit Separator
            Text("Edit Point ")
                .font(.system(size: 25))
                .position(x: 207, y: 320)

            // View to edit point data, at bottom of sheet
            PointEditView(region: $region, markers: $markers, point: $point, sheetOn: $sheetOn)
            
        }
    }
}

