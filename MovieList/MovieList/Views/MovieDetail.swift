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
        ScrollView {
            VStack(alignment: .leading, spacing: 5, content: {
                WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade)
                    .scaledToFill()
                if let title = movieDetail.movieDetail?.title {
                    Text(title)
                        .font(.largeTitle)
                }
                
                if let runTime = movieDetail.movieDetail?.runtime {
                    DataElement(title: "Runtime", data: "\(runTime) mins.")
                }
                
                if let releaseDate = movieDetail.movieDetail?.releaseDate {
                    DataElement(title: "Release Date", data: releaseDate)
                }
                
                if let score = movieDetail.movieDetail?.voteAverage {
                    DataElement(title: "Score", data: String(score))
                }
                
                if (movieDetail.movieDetail?.genres) != nil {
                    DataElement(title: "Genres",
                                data: movieDetail.movieDetail?.genresTo() ?? "")
                }
                
                if let description = movieDetail.movieDetail?.overview {
                    DataElement(title: "Overview",
                                data: description)
                }
            })
            .padding()
        }
    }
}

struct DataElement: View {
    var title: String
    var data: String
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.headline)
            HStack {
                Text(data)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(adult: true,
                                 backdropPath: "/tYkMtYPNpUdLdzGDUTC5atyMh9X.jpg",
                                 genreIDS: [28, 53, 80, 18],
                                 id: 553604,
                                 originalLanguage: "en",
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


