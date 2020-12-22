//
//  MovieDetail.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetail: View {
    var movie : Movie
    @ObservedObject var movieDetail: MovieDetailController
    
    init(movie: Movie) {
        self.movie = movie
        self.movieDetail = MovieDetailController(movie: movie)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text(movie.title ?? "")
                .font(.largeTitle)
            Text("Duracion")
                .font(.headline)
            Text("122 mins")
            Text("Fecha de Estreno")
                .font(.headline)
            Text("2 octubre 2019")
            Text("Calificacion")
                .font(.headline)
            Text("8.5")
            Text("Generos")
                .font(.headline)
            Text("Crimen, Suspense, Drama")
            Text("Descripcion")
                .font(.headline)
        })
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(adult: true,
                                 backdropPath: "/tYkMtYPNpUdLdzGDUTC5atyMh9X.jpg",
                                 genreIDS: [28, 53, 80, 18],
                                 id: 553604,
                                 originalLanguage: OriginalLanguage(rawValue: "en") ?? .en,
                                 originalTitle: "Honest Thief",
                                 overview: "A bank robber tries to turn himself in because he's falling in love and wants to live an honest life...but when he realizes the Feds are more corrupt than him, he must fight back to clear his name.",
                                 popularity: 2185.404,
                                 posterPath: "/zeD4PabP6099gpE0STWJrJrCBCs.jpg",
                                 releaseDate: "2020-09-03",
                                 title: "Honest Thief",
                                 video: false,
                                 voteAverage: 7,
                                 voteCount: 230))
    }
}
