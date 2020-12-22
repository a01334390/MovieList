//
//  MovieCard.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCard: View {
    var movie: Movie
    var body: some View {
        VStack {
            ZStack {
                WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade)
                InformationalView(movie: movie)
            }
        }
        .frame(width: 170, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .cornerRadius(10.0)
    }
}

struct InformationalView: View {
    var movie: Movie
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .frame(height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .opacity(0.7)
                HStack {
                    VStack {
                        Text(movie.title ?? "No Title")
                            .colorInvert()
                            .font(.headline)
                        Text(movie.releaseDate ?? "No Date")
                            .colorInvert()
                            .font(.caption)
                    }
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                    Text(String(movie.voteAverage ?? 0.0))
                        .colorInvert()
                        .padding(.horizontal, -5)
                }
            }
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie(adult: true,
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


