//
//  GalleryView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct GalleryView: View {

    @State private var selectedAnimal = "lion"

    private let animals: [Animal] = Bundle.main.decode("animals.json")

    let gridLayout: [GridItem] = Array.init(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 8)
                    }
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            }
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical, 50.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
