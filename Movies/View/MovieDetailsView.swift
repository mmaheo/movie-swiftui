//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Maxime Maheo on 24/09/2020.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    @EnvironmentObject var movieStore: MovieStore

    private var posterWidth: CGFloat {
        130
    }

    private var posterHeight: CGFloat {
        posterWidth * 1.5
    }

    // MARK: - Body

    var body: some View {
        movieStore.selectedMovie.map { movie in
            ScrollView(.vertical) {
                ZStack(alignment: .top) {
                    RemoteImageComponent(url: movie.backdropPathUrl(size: .medium))
                        .frame(height: posterHeight * 1.3)
                        .blur(radius: 2)

                    VStack(alignment: .leading,
                           spacing: 16) {
                        makeBackButtonView()

                        makePosterImageView()

                        Text(movie.title)
                            .font(.title)

                        makeReleaseDateView()

                        Text(movie.overview)
                            .foregroundColor(Color.primary.opacity(0.7))
                    }
                    .padding(.horizontal)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }

    // MARK: - Methods

    private func makeBackButtonView() -> some View {
        Button(action: {
            movieStore.dispatch(action: .hideDetailsSheet)
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 42,
                           height: 42)
                    .opacity(0.8)

                Image(systemName: "multiply")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundColor(.accent)
            }
        })
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 24)
    }

    private func makePosterImageView() -> some View {
        movieStore.selectedMovie.map { movie in
            HStack {
                RemoteImageComponent(url: movie.posterPathUrl(size: .small),
                                     width: posterWidth,
                                     height: posterHeight)

                Spacer()
            }
        }
    }

    private func makeReleaseDateView() -> some View {
        movieStore.selectedMovie?.releaseDate.map { releaseDate in
            HStack {
                Image(systemName: "calendar")

                Text("§Release on: ")

                Text(releaseDate.toString(dateStyle: .long))
                    .bold()
            }
            .foregroundColor(.accent)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
            .environmentObject(MovieStore.previewStore)
    }
}
