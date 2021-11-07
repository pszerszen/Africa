//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct AnimalDetailView: View {

    let animal: Animal

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20.0) {
                // MARK: - Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                // MARK: - Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8.0)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y: 24))

                // MARK: - Headline
                Text(animal.headline)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)

                // MARK: - Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled",
                                headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                // MARK: - Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                // MARK: - Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)

                // MARK: - Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)

                // MARK: - Link
                Group {
                    HeadingView(headingImage: "book.vertical", headingText: "Learn more")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)

            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: (Bundle.main.decode("animals.json") as [Animal])[0])
        }
        .previewDevice("iPhone 12 Pro")
    }
}
