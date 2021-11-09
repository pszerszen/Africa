//
//  ContentView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct ContentView: View {

    private let animals = DataHelper.main.animals
    private let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var gridLayout = Array.init(repeating: GridItem(.flexible()), count: 1)
    @State private var toolbarIcon = "square.grid.2x2"

    @State private var isGridViewActive = false

    var body: some View {
        NavigationView {

            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300.0)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn, value: gridLayout.count)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16.0) {
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            switchLayout()
                            isGridViewActive = true
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }

    private func switchLayout() {
        gridLayout = Array.init(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)

        switch gridLayout.count {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                fatalError("Invalid gridLayout size: \(gridLayout.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
