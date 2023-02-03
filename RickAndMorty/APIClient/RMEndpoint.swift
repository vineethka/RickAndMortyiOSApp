//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/3/23.
//

import Foundation

/// Represnts unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
