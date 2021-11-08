//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Piotr Szerszeń on 08/11/2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {

    let videoSelected: String
    let videoTitle: String

    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected))
                .overlay(Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32.0, height: 32.0)
                            .padding(.top, 6.0)
                            .padding(.horizontal, 8.0),
                         alignment: .topLeading)
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
