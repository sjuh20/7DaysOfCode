//
//  MovieModel.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 09/01/23.
//

import Foundation

struct Movie {
    let id: Int
    var title: String
    var releaseDate: String
    var image: String?
    var overview: String
    var voteAverage: Double
}

let movies: [Movie] = [
    Movie(id: 1, title: "Órfã 2: A Origem", releaseDate: "2022", image: "orfa", overview: "", voteAverage: 7.2),
    Movie(id: 2, title: "Minions 2: A Origem de Gru", releaseDate: "2022", image: "minions", overview: "", voteAverage: 7.8),
    Movie(id: 3, title: "Thor: Amor e Trovão", releaseDate: "2022", image: "thor", overview: "", voteAverage: 6.8),
    Movie(id: 4, title: "Avatar", releaseDate: "2022", image: "avatar", overview: "", voteAverage: 8.8),
]


