//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct AnimalListItemView: View {

    let animal: Animal

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack(alignment: .leading, spacing: 8.0) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)

                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8.0)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListItemView(animal: DataHelper.main.animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
