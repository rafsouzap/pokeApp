//
//  Ability.swift
//  pokeApp
//
//  Created by Rafael de Paula on 18/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Ability: Codable {
    
    struct AbilityItem: Codable {
        let url: String
        let name: String
    }
    let slot: Int
    let isHidden: Bool
    let ability: AbilityItem
    
    private enum CodingKeys: String, CodingKey {
        case slot
        case isHidden = "is_hidden"
        case ability
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try values.decode(Int.self, forKey: .slot)
        self.isHidden = try values.decode(Bool.self, forKey: .isHidden)
        self.ability = try values.decode(AbilityItem.self, forKey: .ability)
    }
}
