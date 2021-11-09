//
//  VideoListGroup.swift
//  Africa
//
//  Created by Piotr Szerszeń on 05/11/2021.
//

import SwiftUI

struct VideoListView: View {

    @State var videos: [Video] = DataHelper.main.videos

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: {
                    VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                }, label: {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8.0)
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListGroup_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
