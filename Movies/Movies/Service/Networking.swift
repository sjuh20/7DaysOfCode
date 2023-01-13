//
//  Networking.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 12/01/23.
//

import UIKit
import Foundation

class Networking : UIImageView {
    
    
    func fetchMovies(completionHandle: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=8eb6c777ec4afbd830c7340eca705fd1&language=pt-BR&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            
            if let error = error {
                print("Erro ao obter os filmes: \(error)")
                return
            }
            
            guard let httpReponse = response as? HTTPURLResponse, (200...299).contains(httpReponse.statusCode) else {
                print("Erro na resposta. Código de status esperado: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let movieSummary = try? JSONDecoder().decode(MovieResults.self, from: data) {
                completionHandle(movieSummary.results )
            }
        })
        task.resume()
        
        
    }
    
    
}
