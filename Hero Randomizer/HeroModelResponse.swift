//
//  HeroModelResponse.swift
//  Hero Randomizer
//
//  Created by Дархан Есенкул on 05.12.2022.
//

import Foundation

struct HeroModelResponse: Decodable{
    let name: String
    let images: HeroImage
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
}


struct HeroModelInfo: Decodable{
    let name: String
    let appearance: Appearance
    let biography: Biography
}

struct HeroImage: Decodable{
    let sm: String
}

struct Powerstats: Decodable{
    let intelligence: Int
    let power: Int
    let speed: Int
}

struct Appearance: Decodable{
    let gender: String
    let height: [String]
    let weight: [String]
}
struct Biography: Decodable{
    let fullName: String
    let aliases: [String]
    let placeOfBirth: String
    let publisher: String
}




