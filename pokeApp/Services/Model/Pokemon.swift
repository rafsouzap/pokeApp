//
//  Pokemon.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct PokemoonRoot: Codable {
    let results: [Pokemon]
    private enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Pokemon: Codable {
    
    let name: String
    let sprite: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.sprite = AppEnvironment.baseSpriteURL.value.replacingOccurrences(of: "[POKEMON_NAME]", with: self.name)
    }
}
