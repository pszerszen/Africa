//
//  Location.swift
//  Africa
//
//  Created by Piotr Szerszeń on 07/11/2021.
//

import Foundation

struct Location: Codable, Identifiable {

    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
}
