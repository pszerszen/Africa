//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 08/11/2021.
//

import SwiftUI

struct MapAnnotationView: View {

    let location: NationalParkLocation

    @State private var animation = 0.0

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54.0, height: 54.0, alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(CGFloat(animation) + 1)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48.0, height: 48.0)
            .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: DataHelper.main.locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
