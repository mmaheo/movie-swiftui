//
//  PopularMoviesEndpoint.swift
//  Shared
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

final class PopularMoviesEndpoint: TMDBApiEndpoint, ApiEndpoint {
    
    typealias RequestDataType = Void
    typealias ResponseDataType = [Movie]
    
    // MARK: - Methods
    func buildRequest(parameters: PopularMoviesEndpoint.RequestDataType) throws -> Request {
        try buildRequest(method: "movie/popular")
            .addQueryParameters(parameters: ["region": Locale.current.regionCode ?? "US"])
    }
    
    func parseResponse(data: Data) throws -> PopularMoviesEndpoint.ResponseDataType {
        try JSONDecoder()
            .decode(MovieList.self, from: data)
            .results
    }
}
