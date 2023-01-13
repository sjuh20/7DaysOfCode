//
//  MovieModel.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 09/01/23.
//

import Foundation

struct MovieResults: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    var title: String
    var release_date: String
    var poster_path: String?
    var overview: String
    var vote_average: Double
}

