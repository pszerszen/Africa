//
//  CoverImageView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages = DataHelper.main.coverImages

    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
