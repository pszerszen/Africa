//
//  MapView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI
import MapKit

struct MapView: View {

    @State private var region: MKCoordinateRegion = {
        let mapCoordinates =  CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)

        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        // MARK: - Basic map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // Standard Markers
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            // Custom Markers
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32.0, height: 32.0, alignment: .center)
            //            }
            //

            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .overlay(alignment: .top, content: {
            HStack(alignment: .center, spacing: 12.0) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3.0) {
                    HStack {
                        Text("Latitude:")
                            .fontWeight(.bold)
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitute:")
                            .fontWeight(.bold)
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                }
            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 16.0)
            .background(Color.black.cornerRadius(8).opacity(0.6))
            .padding()
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
