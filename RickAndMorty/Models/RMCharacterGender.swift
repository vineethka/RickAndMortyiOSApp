//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Vineeth Aravindan on 2/3/23.
//

import Foundation


/// Represents a gender of a character
enum RMCharacterGender: String, Codable {
    
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
