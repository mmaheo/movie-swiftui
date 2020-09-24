//
//  MovieStore.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import Combine
import Foundation

enum MovieSection: String {
    case popular = "§Popular"
    case upcoming = "§Upcoming"
    case topRated = "§Top rated"
    case nowPlaying = "§Now playing"
}

enum MovieStoreAction {
    case fetchMovies(section: MovieSection)
    case showDetailsSheet(movie: Movie)
    case hideDetailsSheet
}

final class MovieStore: ObservableObject {
    // MARK: - Properties

    @Published var movies: [MovieSection: [Movie]]
    @Published var selectedMovie: Movie?
    @Published var detailsSheetIsShowing: Bool

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle

    init(movies: [MovieSection: [Movie]] = [:],
         selectedMovie: Movie? = nil,
         detailsSheetIsShowing: Bool = false) {
        self.movies = movies
        self.selectedMovie = selectedMovie
        self.detailsSheetIsShowing = detailsSheetIsShowing
    }

    // MARK: - Methods

    func dispatch(action: MovieStoreAction) {
        switch action {
        case let .fetchMovies(section):
            fetchMovies(section: section)
        case let .showDetailsSheet(movie):
            selectedMovie = movie
            detailsSheetIsShowing = true
        case .hideDetailsSheet:
            detailsSheetIsShowing = false
        }
    }

    func movies(from section: MovieSection) -> [Movie] {
        movies[section] ?? []
    }

    private func fetchMovies(section: MovieSection) {
        var source: AnyPublisher<[Movie], Error>

        switch section {
        case .popular:
            source = MovieService.shared.fetchPopular()
        case .nowPlaying:
            source = MovieService.shared.fetchNowPlaying()
        case .topRated:
            source = MovieService.shared.fetchTopRated()
        case .upcoming:
            source = MovieService.shared.fetchUpcoming()
        }

        source
            .receive(on: DispatchQueue.main)
            .sink { _ in

            } receiveValue: { [weak self] movies in
                self?.movies[section] = movies
            }
            .store(in: &cancellables)
    }
}

#if DEBUG
extension MovieStore {
    static let previewStore = MovieStore(movies: [.popular: Movie.list,
                                                  .upcoming: Movie.list,
                                                  .topRated: Movie.list,
                                                  .nowPlaying: Movie.list])
}
#endif
