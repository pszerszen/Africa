//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 09/11/2021.
//

import SwiftUI

struct AnimalGridItemView: View {

    let animal: Animal

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGridItemView(animal: DataHelper.main.animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
