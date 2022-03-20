//
//  CoorsInputView.swift
//  Maps
//
//  Created by Caleb Ras on 3/7/22.
//

import SwiftUI
import MapKit


// View for lat and long input fields
// Updates region on sumbit
struct CoorsInputView: View {
    
    // Passed variables
    @Binding var locationOn: Bool
    @Binding var region: MKCoordinateRegion
    
    // Lat and Long
    @State private var latInput: String = ""
    @State private var longInput: String = ""
    
    // View body
    var body: some View {
        ZStack {
            
            // Lat input field
            TextField("  Latitude", text: $latInput)
                .frame(width: 380, height: 40, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white))
                .foregroundColor(.black)
                .shadow(radius: 3)
                .position(x: 207, y: 30)
            
            
            // Long input field
            TextField("  Longitude", text: $longInput)
                .frame(width: 380, height: 40, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white))
                .foregroundColor(.black)
                .shadow(radius: 3)
                .position(x: 207, y: 75)
                .onSubmit {
                    locationOn = false
                    updateRegion()
                }
        }

    }
    
    
    // Updates region based on current self lat and long
    private func updateRegion() {
        
        //Unpack lat and long
        guard let lat = Double(latInput) else { return }
        guard let long = Double(longInput) else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: lat,
                                                longitude: long)
        region = MKCoordinateRegion(
            center: coordinate,
            span: RegionDefault.span)
    }
}



