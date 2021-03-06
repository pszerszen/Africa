//
//  GalleryView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct GalleryView: View {

    private let animals = DataHelper.main.animals
    private let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var selectedAnimal = "lion"
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 3.0

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(selectedAnimal)
                    .circleFrame(lineWidth: 8)

                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .circleFrame()
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn, value: gridLayout.count)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical, 50.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }

    private func gridSwitch() {
        gridLayout = Array.init(repeating: .init(.flexible()), count: Int(gridColumn))
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

fileprivate extension Image {
    func circleFrame(lineWidth: CGFloat = 1) -> some View {
        return self
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white, lineWidth: lineWidth)
            }
    }
}
