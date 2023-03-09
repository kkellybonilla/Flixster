//
//  Poster.swift
//  project2-Flixster
//
//  Created by Kelly Bonilla Guzmán on 3/8/23.
//

import Foundation

struct PostersResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
    }
    
    let posterPath: String
}
