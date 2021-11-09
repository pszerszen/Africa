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

    private let locations = DataHelper.main.locations

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
                        Text("Latitude:").coordinateTitle()
                        Spacer()
                        Text("\(region.center.latitude)").coordinateValue()
                    }
                    Divider()
                    HStack {
                        Text("Longitute:").coordinateTitle()
                        Spacer()
                        Text("\(region.center.longitude)").coordinateValue()
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

fileprivate extension Text {

    func coordinateTitle() -> some View {
        return self
            .fontWeight(.bold)
            .font(.footnote)
            .foregroundColor(.accentColor)
    }

    func coordinateValue() -> some View {
        return self
            .font(.footnote)
            .foregroundColor(Color.white)
    }
}
