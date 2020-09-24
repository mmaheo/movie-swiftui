//
//  SearchMovieEndpoint.swift
//  MovieSwiftUI
//
//  Created by Maxime Maheo on 24/06/2020.
//

import Foundation

final class SearchMovieEndpoint: TMDBApiEndpoint, ApiEndpoint {
    
    typealias RequestDataType = String
    typealias ResponseDataType = [Movie]
    
    // MARK: - Methods
    func buildRequest(parameters: SearchMovieEndpoint.RequestDataType) throws -> Request {
        try buildRequest(method: "search/movie")
            .addQueryParameters(parameters: ["query": parameters,
                                             "region": Locale.current.regionCode ?? "US"])
    }
    
    func parseResponse(data: Data) throws -> SearchMovieEndpoint.ResponseDataType {
        try JSONDecoder()
            .decode(MovieList.self, from: data)
            .results
    }
}
