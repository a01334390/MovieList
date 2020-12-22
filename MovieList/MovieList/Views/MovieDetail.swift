//
//  MovieDetail.swift
//  MovieList
//
//  Created by Fernando Martin Garcia Del Angel on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetail: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text("Guason")
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
        MovieDetail()
    }
}
