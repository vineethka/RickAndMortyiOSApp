//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/3/23.
//

import Foundation

/// Represents a status of a character
enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
