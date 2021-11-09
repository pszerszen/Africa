//
//  InsetFactView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 07/11/2021.
//

import SwiftUI

struct InsetFactView: View {

    let animal: Animal

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        InsetFactView(animal: DataHelper.main.animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
