//
//  PokemonDetail.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct PokemonDetail: Codable {
    
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let types: [Type]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case height
        case baseExperience = "base_experience"
        case types
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.weight = try values.decode(Int.self, forKey: .weight)
        self.height = try values.decode(Int.self, forKey: .height)
        self.baseExperience = try values.decode(Int.self, forKey: .baseExperience)
        self.types = try values.decode([Type].self, forKey: .types)
    }
}
