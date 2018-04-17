//
//  PokemonList.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct PokemonList {
    
    let name: String
    let imageUrl: String
    
    init(with pokemon: Pokemon) {
        self.name = pokemon.name.capitalized
        self.imageUrl = AppEnvironment.baseSpriteURL.value.replacingOccurrences(of: "[POKEMON_NAME]", with: pokemon.name)
    }
}
