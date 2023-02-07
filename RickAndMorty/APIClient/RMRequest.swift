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
    let pathComponents: [String]
    
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
    
    /// Computed & constructed apl url
    public var url: URL? {
        return URL(string: self.urlString)
    }
    
    // MARK: - Public

    /// Constuct method
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParamers: Collection of Query Parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParamers: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParamers = queryParamers
    }
    
    /// Attempt ot create request
    /// - Parameter url: url to parse
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl + "/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                var pathCompoent: [String] = []
                if components.count > 1 {
                    pathCompoent = components
                    pathCompoent.removeFirst()
                }
                if let rmEndpoint = RMEndpoint(
                    rawValue: endpointString){
                    self.init(endpoint: rmEndpoint, pathComponents: pathCompoent)
                    return
                }
            }
        }else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                
                let queryItems:[URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1])
                })
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndpoint, queryParamers: queryItems)
                    return
                }
            }
        }
        
        return nil
    }
}


extension RMRequest {
    static let listChacterRequests = RMRequest(endpoint: .character)
}
