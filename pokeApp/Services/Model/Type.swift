//
//  Type.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Type: Codable {
    
    struct TypeItem: Codable {
        let url: String
        let name: String
    }
    let slot: Int
    let type: TypeItem
    
    private enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try values.decode(Int.self, forKey: .slot)
        self.type = try values.decode(TypeItem.self, forKey: .type)
    }
}
