//
//  Movie.swift
//  Africa
//
//  Created by Piotr Szerszeń on 08/11/2021.
//

import SwiftUI

struct Video: Codable, Identifiable {

    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        return "video-\(id)"
    }
}
