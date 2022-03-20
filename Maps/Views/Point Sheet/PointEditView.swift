//
//  PointEditView.swift
//  Maps
//
//  Created by Caleb Ras on 3/16/22.
//

import SwiftUI
import MapKit


// View consisting of input boxes to edit a point's data
struct PointEditView: View {
    
    // Passed member variables
    @Binding var region: MKCoordinateRegion
    @Binding var markers: Array<PointOfInterest>
    @Binding var point: PointOfInterest
    @Binding var sheetOn: Bool
    
    // Input variables
    @State private var nameInput: String = ""
    @State private var descInput: String = ""
    @State private var latInput: String = ""
    @State private var longInput: String = ""
    
    // View body
    var body: some View {

        // Name input
        Text("Name: ")
            .font(.system(size: 20))
            .position(x: 50, y: 350)
        
        TextField(getNameText(), text: $nameInput)
            .frame(width: 380, height: 40, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white))
            .foregroundColor(.black)
            .shadow(radius: 3)
            .position(x: 207, y: 390)
        
        
        // Cooridnates inputs
        Text("Coordinates: ")
            .font(.system(size: 20))
            .position(x: 75, y: 440)
        
        // Lat
        let pointLat = "  Lat: \(String(format: "%.6f", point.lat))"
        TextField(pointLat, text: $latInput)
            .frame(width: 380, height: 40, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white))
            .foregroundColor(.black)
            .shadow(radius: 3)
            .position(x: 207, y: 480)
        
        // Long
        let pointLong = "  Long: \(String(format: "%.6f", point.long))"
        TextField(pointLong, text: $longInput)
            .font(.system(size: 16))
            .frame(width: 380, height: 40, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white))
            .foregroundColor(.black)
            .shadow(radius: 3)
            .position(x: 207, y: 530)
        
        
        //Description input
        Text("Description")
            .font(.system(size: 20))
            .position(x: 69, y: 580)
        
        TextField(getDesciptionText(), text: $descInput)
            .multilineTextAlignment(.leading)
            .frame(width: 380, height: 100, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white))
            .foregroundColor(.black)
            .shadow(radius: 3)
            .position(x: 207, y: 650)
        
        
        //Save Button, saves the current inputs the marker list point
        Button {
            savePoint()
            
            // Refresh sheet data
            sheetOn = false

        } label: {
            Text("Save")
        }
        .frame(width: 380, height: 40, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 7)
                        .fill(Color.white))
        .shadow(radius: 3)
        .position(x: 207, y: 750)
    }
    
    
    // Returns the point's name if it has one
    private func getNameText() -> String {
        var nameText = "  \(point.name)"
        
        if point.name == "" { nameText = "  Name" }
        return nameText
    }
    
    
    // Returns point's desciption if it has one
    private func getDesciptionText() -> String {
        var descText = "  \(point.description)"
        
        if point.description == "" { descText = "  No data to display" }
        return descText
    }
    
    
    // Returns the index of the point in markers that matches self.point
    private func getPointIndex() -> Int {
        var pointIndex = 0
        
        for i in markers {
            if i.id == point.id { break }
            pointIndex += 1
        }
        
        return pointIndex
    }
    
    
    // Saves the current inputted data to the point in the markers array
    private func savePoint() {
        
        // Lat
        var lat = 0.0
        if let latIn = Double(latInput) {
            lat = latIn
        }
        else {
            lat = point.lat
        }
        
        //Long
        var long = 0.0
        if let longIn = Double(longInput) {
            long = longIn
        }
        else {
            long = point.long
        }
        
        // Name
        var name = nameInput
        if name == ""  && point.name != "" {
            name = point.name
        }
        
        //Description
        var desc = descInput
        if desc == "" && point.description != "" {
            desc = point.description
        }
        
        // Update point in markers
        let pointIndex = getPointIndex()
        markers[pointIndex].lat = lat
        markers[pointIndex].long = long
        markers[pointIndex].name = name
        markers[pointIndex].description = desc
    }
}

