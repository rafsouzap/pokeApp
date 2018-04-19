//
//  Move.swift
//  pokeApp
//
//  Created by Rafael de Paula on 18/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Move: Codable {
    
    struct MoveItem: Codable {
        let url: String
        let name: String
    }
    let move: MoveItem
    
    private enum CodingKeys: String, CodingKey {
        case move
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.move = try values.decode(MoveItem.self, forKey: .move)
    }
}
