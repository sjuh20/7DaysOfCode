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

let movies: [Movie] = [
    Movie(id: 1, title: "Órfã 2: A Origem", release_date: "2022", poster_path: "orfa", overview: "", vote_average: 7.2),
    Movie(id: 2, title: "Minions 2: A Origem de Gru", release_date: "2022", poster_path: "minions", overview: "", vote_average: 7.8),
    Movie(id: 3, title: "Thor: Amor e Trovão", release_date: "2022", poster_path: "thor", overview: "", vote_average: 6.8),
    Movie(id: 4, title: "Avatar", release_date: "2022", poster_path: "avatar", overview: "", vote_average: 8.8),
    Movie(id: 4, title: "Ginny e Georgia", release_date: "2021", poster_path: "ginny", overview: "", vote_average: 8.1),
    Movie(id: 4, title: "Mundo Estranho", release_date: "2022", poster_path: "mundo", overview: "", vote_average: 6.5),
    Movie(id: 4, title: "A Mulher Rei", release_date: "2022", poster_path: "mulher", overview: "", vote_average: 7.8),
]


