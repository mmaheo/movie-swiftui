//
//  UpcomingMoviesEndpoint.swift
//  MovieSwiftUI
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

final class UpcomingMoviesEndpoint: TMDBApiEndpoint, ApiEndpoint {
    
    typealias RequestDataType = Void
    typealias ResponseDataType = [Movie]
    
    // MARK: - Methods
    func buildRequest(parameters: UpcomingMoviesEndpoint.RequestDataType) throws -> Request {
        try buildRequest(method: "movie/upcoming")
            .addQueryParameters(parameters: ["region": Locale.current.regionCode ?? "US"])
    }
    
    func parseResponse(data: Data) throws -> UpcomingMoviesEndpoint.ResponseDataType {
        try JSONDecoder()
            .decode(MovieList.self, from: data)
            .results
    }
}
