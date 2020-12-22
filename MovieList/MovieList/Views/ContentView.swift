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
            VStack {
                SearchBar(text: $searchText, placeholder: "Search for Movies...")
                Spacer()
                List {
                    ForEach(self.movieFeed.filter {
                        self.searchText.isEmpty ? true : $0.title?.lowercased().contains(self.searchText.lowercased()) ?? false
                    }, id: \.self) { movie in
                        ZStack {
                            HStack {
                                Spacer()
                                MovieCard(movie: movie)
                                    .onAppear {
                                        self.movieFeed.loadMoreMovies(currentItem: movie)
                                    }
                                Spacer()
                            }
                            NavigationLink(destination: MovieDetail(movie: movie)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
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
