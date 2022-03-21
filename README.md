# Overview

This repository contains an iOS map application, similar to Apple's Maps, that I created. When opened, the app displays a map background and two text fields where latitude and longitude can be used to navigate the map to different global coordinates. In the left-hand corner, the current coordinates of the center of the map are displayed and updated in real-time as the user scrolls. The main screen also has three buttons:
1. Location Button, which toggles centering the map on the user's current location
2. Add Button, which adds a new marker at the center of the map
3. Info Button, which displays information about the nearest marker

The marker information is displayed through a sheet containing the name, coordinates, and description of the point. The sheet also allows for the user to edit the data through a few text fields easily. 

I designed and implemented this application to learn more about iOS development and digital maps. Through this project, I broadened my understanding in both areas. While writing for Apple's mobile devices, I learned the ins and outs of SwiftUI Views and Models and along with many of the UI components. As I implemented the maps, I discovered how to control the current region view, display and manage a device's location, and add marker annotations of specific points using Apple's MapKit and CoreLocation libraries. I plan to continue these pursuits and hopefully enter into the mobile map development field in the future.

Please click on the link below for a video demonstration of the software and a walk-through of the code. 
[Software Demo Video](https://youtu.be/3YjR9i3SxlM)

# Development Environment
* Xcode 13.2.1
* Swift 5.5.3
* SwiftUI
* MapKit


# Useful Websites
* [Apple SwiftUI Tutorial](https://developer.apple.com/tutorials/swiftui)
* [MapKit Documentation](https://developer.apple.com/documentation/mapkit/)
* [SwiftUI User Location on a Map ](https://www.youtube.com/watch?v=hWMkimzIQoU/)


# Future Work
Here are some of the features I plan on adding in the future:
* Add a directional compass using the MKMapView class
* Allow the storing of the add markers through reading and writing to a file
* Replace the Latitude and Longitude inputs with a search bar
* Publish on the iOS AppStore