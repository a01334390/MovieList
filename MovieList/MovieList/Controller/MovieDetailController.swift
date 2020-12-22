//
//  MovieDetailController.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import Foundation
import Keys

class MovieDetailController: ObservableObject {
    typealias Element = APIMovieDetail
    @Published var movieDetail : APIMovieDetail?
    
    private let url = "https://api.themoviedb.org/3/movie/"
    
    init(movie: Movie) {
        self.getDetailedMovie(movie: movie)
    }
    
    private func getDetailedMovie(movie: Movie) {
        if let url = URL(string: "\(url)?api_key=\(MovieListKeys().movieAPIKey)&language=en-US") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(APIMovieDetail.self, from: data)
                        self.movieDetail = response
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
}

