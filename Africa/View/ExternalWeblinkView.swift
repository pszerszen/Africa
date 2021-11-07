//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 07/11/2021.
//

import SwiftUI

struct ExternalWeblinkView: View {

    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")

                    Link(animal.name,
                         destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWeblinkView(animal: (Bundle.main.decode("animals.json") as [Animal])[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
