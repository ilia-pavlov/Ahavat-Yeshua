//
//  HolyPlacesMapView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
// let holyLandData: HolyLandData = .init()

import SwiftUI
import MapKit

struct HolyPlacesMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.7683, longitude: 35.2137), // Default to Jerusalem
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    @State private var selectedPlace: HolyPlace?
    
    let holyLandData: HolyLandData = .init()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: holyLandData.holyPlaces) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    VStack {
                        Image(systemName: "star.fill")
                            .font(.title)
                            .foregroundColor(.yellow)
                        Text(place.name)
                            .font(.caption)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.7), in: RoundedRectangle(cornerRadius: 5))
                            .padding(5)
                    }
                    .onTapGesture {
                        selectedPlace = place
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: zoomIn) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue.opacity(0.7), in: Circle())
                            .shadow(radius: 10)
                    }
                    Button(action: zoomOut) {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue.opacity(0.7), in: Circle())
                            .shadow(radius: 10)
                    }
                }
                .padding()
                Spacer()
            }
            
            // Description Window
            if let selectedPlace = selectedPlace {
                VStack {
                    HStack {
                        Text(selectedPlace.name)
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                        Button(action: { self.selectedPlace = nil }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    Text(selectedPlace.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
                    Text("Bible Reference: \(selectedPlace.bibleReference)")
                                            .font(.footnote)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.black.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                .background(Color.black.opacity(0.6), in: RoundedRectangle(cornerRadius: 15))
                .padding()
            }
        }
    }
    
    // Zoom-in functionality
    private func zoomIn() {
        withAnimation {
            region.span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 0.5, longitudeDelta: region.span.longitudeDelta * 0.5)
        }
    }
    
    // Zoom-out functionality
    private func zoomOut() {
        withAnimation {
            region.span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 2, longitudeDelta: region.span.longitudeDelta * 2)
        }
    }
}

struct HolyPlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        HolyPlacesMapView()
    }
}
