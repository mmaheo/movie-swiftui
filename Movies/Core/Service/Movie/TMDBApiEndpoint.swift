//
//  TMDBApiEndpoint.swift
//  Shared
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

class TMDBApiEndpoint {
    // MARK: - Methods
    
    func buildRequest(method: String) throws -> BaseRequest {
        let stringUrl = "https://api.themoviedb.org/3/\(method)"
        
        guard let request = BaseRequest(baseStringUrl: stringUrl) else {
            throw RequestError.failedToCreateRequestWithUrl(stringUrl)
        }
        
        return request.addQueryParameters(parameters: ["api_key": TMDB.apiKey,
                                                       "language": Locale.preferredLanguages.first ?? "en-US"])
    }
}
