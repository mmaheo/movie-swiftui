//
//  MovieService.swift
//  Shared
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Combine

protocol MovieServiceContract {
    func fetchPopular() -> AnyPublisher<[Movie], Error>
    func fetchNowPlaying() -> AnyPublisher<[Movie], Error>
    func fetchUpcoming() -> AnyPublisher<[Movie], Error>
    func fetchTopRated() -> AnyPublisher<[Movie], Error>
    func searchMovies(query: String) -> AnyPublisher<[Movie], Error>
}

final class MovieService: MovieServiceContract {
    // MARK: - Properties
    
    static let shared: MovieServiceContract = MovieService()
    
    private let apiRequester = ApiRequester()
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Methods
    
    func fetchPopular() -> AnyPublisher<[Movie], Error> {
        apiRequester.fetch(PopularMoviesEndpoint(), with: ())
    }
    
    func fetchNowPlaying() -> AnyPublisher<[Movie], Error> {
        apiRequester.fetch(NowPlayingMoviewEndpoint(), with: ())
    }
    
    func fetchUpcoming() -> AnyPublisher<[Movie], Error> {
        apiRequester.fetch(UpcomingMoviesEndpoint(), with: ())
    }
    
    func fetchTopRated() -> AnyPublisher<[Movie], Error> {
        apiRequester.fetch(TopRatedMoviesEndpoint(), with: ())
    }
    
    func searchMovies(query: String) -> AnyPublisher<[Movie], Error> {
        apiRequester.fetch(SearchMovieEndpoint(), with: query)
    }
}
