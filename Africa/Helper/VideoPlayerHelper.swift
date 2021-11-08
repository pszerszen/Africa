//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Piotr Szerszeń on 08/11/2021.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String = "mp4") -> AVPlayer {
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()

    }
    return videoPlayer!
}
