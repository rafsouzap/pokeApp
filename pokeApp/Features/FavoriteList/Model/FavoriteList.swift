//
//  FavoriteList.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct FavoriteList {
    
    let name: String
    let imageUrl: String
    
    init(with pokemon: String) {
        self.name = pokemon.capitalized
        self.imageUrl = AppEnvironment.baseSpriteURL.value.replacingOccurrences(of: "[POKEMON_NAME]", with: pokemon)
    }
}
