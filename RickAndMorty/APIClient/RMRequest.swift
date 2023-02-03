//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/3/23.
//

import Foundation

/// Object that represents a single API call.
final class RMRequest {
    
    /// API constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Derived endpoint
    let endpoint: RMEndpoint
    
    /// Path components for API if any
    let pathComponents: Set<String>
    
    /// Query argument for API if any
    let queryParamers: [URLQueryItem]
    
    /// Constuct the url for this enpoint in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParamers.isEmpty {
            string += "?"
            let argumentsString = queryParamers.compactMap ({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentsString
        }
        return string
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    // Mark: - Public
    
    /// Computed & constructed apl url
    public var url: URL? {
        return URL(string: self.urlString)
    }
    /// Constuct method
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParamers: Collection of Query Parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParamers: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParamers = queryParamers
    }
}
