//
//  MovieSectionComponent.swift
//  Movies
//
//  Created by Maxime Maheo on 24/09/2020.
//

import SwiftUI

struct MovieSectionComponent: View {
    // MARK: - Properties

    @EnvironmentObject var movieStore: MovieStore
    let section: MovieSection

    private var movies: [Movie] {
        movieStore.movies(from: section)
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(section.rawValue)
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal,
                       showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    if movies.isEmpty {
                        HorizontalLoadingComponent(placeholder: "§Fetching movies...")
                    } else {
                        ForEach(movies.indices) { index in
                            if index == 0 {
                                MovieCellComponent(movie: movies[index])
                                    .padding(.leading)
                            } else if index == movies.count - 1 {
                                MovieCellComponent(movie: movies[index])
                                    .padding(.trailing)
                            } else {
                                MovieCellComponent(movie: movies[index])
                            }
                        }
                    }
                }
            }
        }
        .onAppear { movieStore.dispatch(action: .fetchMovies(section: section)) }
    }
}

struct MovieSectionComponent_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionComponent(section: .popular)
            .environmentObject(MovieStore.previewStore)
            .previewLayout(.fixed(width: 375,
                                  height: 250))
    }
}
