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
        .frame(minWidth: 85, idealWidth: 170, maxWidth: 340, minHeight: 125, idealHeight: 250, maxHeight: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    .frame(height: 85, alignment: .center)
                    .opacity(0.7)
                HStack {
                    VStack (alignment: .leading) {
                        Text(movie.title ?? "No Title")
                            .colorInvert()
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .lineLimit(3)
                        Text(movie.releaseDate ?? "No Date")
                            .colorInvert()
                            .font(.system(size: 8, weight: .light, design: .default))
                    }
                    .padding(.leading)
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(String(movie.voteAverage ?? 0.0))
                            .colorInvert()
                            .padding(.horizontal)
                            .font(.system(size: 8, weight: .semibold, design: .default))
                    }
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
            .previewLayout(.sizeThatFits)
    }
}


