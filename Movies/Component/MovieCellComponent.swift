//
//  MovieCellComponent.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import SwiftUI

struct MovieCellComponent: View {
    // MARK: - Properties

    @EnvironmentObject var movieStore: MovieStore

    let movie: Movie

    private var posterWidth: CGFloat {
        100
    }

    private var posterHeight: CGFloat {
        posterWidth * 1.5
    }

    // MARK: - Body

    var body: some View {
        Button(action: {
            movieStore.dispatch(action: .showDetailsSheet(movie: movie))
        }, label: {
            RemoteImageComponent(url: movie.posterPathUrl(size: .small),
                                 width: posterWidth,
                                 height: posterHeight)
        })
    }
}

#if DEBUG
struct MovieCellComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieCellComponent(movie: Movie.one)
                .preferredColorScheme(.light)

            MovieCellComponent(movie: Movie.one)
                .preferredColorScheme(.dark)
        }
        .environmentObject(MovieStore.previewStore)
        .previewLayout(.fixed(width: 200,
                              height: 200))
    }
}
#endif
