//
//  MovieListView.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import SwiftUI

struct MovieListView: View {
    // MARK: - Properties

    @EnvironmentObject var movieStore: MovieStore

    // MARK: - Body

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    MovieSectionComponent(section: .popular)
                        .padding(.top)

                    MovieSectionComponent(section: .upcoming)

                    MovieSectionComponent(section: .topRated)

                    MovieSectionComponent(section: .nowPlaying)
                        .padding(.bottom)
                }
            }

            .navigationBarTitle(Text("§Movies"))
        }
        .sheet(isPresented: $movieStore.detailsSheetIsShowing,
               onDismiss: { movieStore.dispatch(action: .hideDetailsSheet) },
               content: {
                   MovieDetailsView()
                       .environmentObject(movieStore)
               })
    }
}

#if DEBUG
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
            .environmentObject(MovieStore.previewStore)
    }
}
#endif
