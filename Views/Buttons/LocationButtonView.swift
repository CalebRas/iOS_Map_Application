//
//  LocationButtonView.swift
//  Maps
//
//  Created by Caleb Ras on 3/13/22.
//

import SwiftUI


// View for a button used to toggle user location
struct LocationButtonView: View {
    
    // Location toggle
    @Binding var locationOn: Bool
    
    // View body
    var body: some View {
        
        // Location button, toggles location follow in MapsView
        Button {
            locationOn.toggle()

        } label: {
            if locationOn == false {
                Image(systemName: "location")       // location off image
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
            } else {
                Image(systemName: "location.fill")      // location on image
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
            }
            
        }
        .frame(width: 50, height: 50, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 7)
                        .fill(Color.white))
        .shadow(radius: 3)
        .position(x: 371, y: 750)
    }
}


// Preview
struct LocationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LocationButtonView(locationOn: .constant(false))
    }
}
