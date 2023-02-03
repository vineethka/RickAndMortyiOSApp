//
//  RMService.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/3/23.
//

import Foundation

/// Primery API service object to get Rick and Morty Data
final class RMService {
    
    /// Shared sigleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
