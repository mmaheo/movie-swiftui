//
//  NowPlayingMoviewEndpoint.swift
//  MovieSwiftUI
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

final class NowPlayingMoviewEndpoint: TMDBApiEndpoint, ApiEndpoint {
    
    typealias RequestDataType = Void
    typealias ResponseDataType = [Movie]
    
    // MARK: - Methods
    func buildRequest(parameters: NowPlayingMoviewEndpoint.RequestDataType) throws -> Request {
        try buildRequest(method: "movie/now_playing")
            .addQueryParameters(parameters: ["region": Locale.current.regionCode ?? "US"])
    }
    
    func parseResponse(data: Data) throws -> NowPlayingMoviewEndpoint.ResponseDataType {
        try JSONDecoder()
            .decode(MovieList.self, from: data)
            .results
    }
}
