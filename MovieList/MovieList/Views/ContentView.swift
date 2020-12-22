//
//  ContentView.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieFeed = MovieFeed()
    @State private var searchText : String = ""
    var hapticImpact = UIImpactFeedbackGenerator(style: .light)
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(movieFeed.movieListItems, id: \.self.lID) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie)) {
                            MovieCard(movie: movie)
                                .onAppear {
                                    self.movieFeed.loadMoreMovies(currentItem: movie)
                                }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
