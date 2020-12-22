//
//  ContentView.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieFeed = MovieFeed()
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
