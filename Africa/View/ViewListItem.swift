//
//  ViewListItem.swift
//  Africa
//
//  Created by Piotr Szerszeń on 08/11/2021.
//

import SwiftUI

struct ViewListItem: View {

    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10.0) {
            ZStack {
                Image(movie.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(height: 32.0)
                    .scaledToFit()
                    .shadow(radius: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
            }

            VStack(alignment: .leading, spacing: 10.0) {
                Text(movie.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(movie.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct ViewListItem_Previews: PreviewProvider {
    static var previews: some View {
        ViewListItem(movie: (Bundle.main.decode("videos.json") as [Movie])[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
