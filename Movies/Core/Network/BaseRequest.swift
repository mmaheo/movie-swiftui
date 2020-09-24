//
//  BaseRequest.swift
//  Shared
//
//  Created by Maxime Maheo on 23/06/2020.
//

import Foundation

class BaseRequest: Request {
    // MARK: - Properties
    
    private var request: URLRequest
    
    var urlRequest: URLRequest {
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    // MARK: - Lifecycle
    
    init?(baseStringUrl: String) {
        guard let url = URL(string: baseStringUrl) else { return nil }
        
        self.request = URLRequest(url: url)
    }
    
    // MARK: - Methods
    
    func addQueryParameters(parameters: [String: Any]) -> Self {
        request.addQueryParameters(parameters: parameters)
        
        return self
    }
}
