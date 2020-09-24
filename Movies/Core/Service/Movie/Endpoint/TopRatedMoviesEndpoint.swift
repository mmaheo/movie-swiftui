//
//  TopRatedMoviesEndpoint.swift
//  MovieSwiftUI
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

final class TopRatedMoviesEndpoint: TMDBApiEndpoint, ApiEndpoint {
    
    typealias RequestDataType = Void
    typealias ResponseDataType = [Movie]
    
    // MARK: - Methods
    func buildRequest(parameters: TopRatedMoviesEndpoint.RequestDataType) throws -> Request {
        try buildRequest(method: "movie/top_rated")
            .addQueryParameters(parameters: ["region": Locale.current.regionCode ?? "US"])
    }
    
    func parseResponse(data: Data) throws -> TopRatedMoviesEndpoint.ResponseDataType {
        try JSONDecoder()
            .decode(MovieList.self, from: data)
            .results
    }
}
