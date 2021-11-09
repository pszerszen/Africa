//
//  DataHandler.swift
//  Africa
//
//  Created by Piotr Szerszeń on 09/11/2021.
//

import Foundation

class DataHelper {

    let animals: [Animal] = Bundle.main.decode("animals.json")
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    let videos: [Video] = Bundle.main.decode("videos.json")

    static let main = DataHelper()
}


fileprivate extension Bundle {

    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
