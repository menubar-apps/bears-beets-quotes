//
//  DTO.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import Foundation

struct CharacterQuote: Codable {
    let id: Int
    let character: String
    let quote: String
    let characterAvatarURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case character
        case quote
        case characterAvatarURL = "character_avatar_url"
    }
}
