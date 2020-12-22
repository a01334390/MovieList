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
        VStack {
            SearchBar(text: $searchText, placeholder: "Search for Movies...")
            Spacer()
            List {
                ForEach(self.movieFeed.filter {
                    self.searchText.isEmpty ? true : $0.title?.lowercased().contains(self.searchText.lowercased()) ?? false
                }, id: \.self) { movie in
                    Button(action: {
                        self.hapticImpact.impactOccurred()
                    }, label: {
                        MovieCard(movie: movie)
                            .onAppear {
                                self.movieFeed.loadMoreMovies(currentItem: movie)
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
