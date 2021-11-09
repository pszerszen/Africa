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


