//
//  InsetMapView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 07/11/2021.
//

import SwiftUI
import MapKit

struct InsetMapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599),
        span: MKCoordinateSpan(
            latitudeDelta: 60.0,
            longitudeDelta: 60.0))

    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView(), label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                        Text("Locations")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 14.0)
                    .background(Color.black.opacity(0.4)
                                    .cornerRadius(8)
                    )
                })
                    .padding(12.0),
                alignment: .topTrailing
            )
            .frame(height: 256.0)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
