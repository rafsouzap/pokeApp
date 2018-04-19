//
//  AppEnvironment.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

enum AppEnvironment {
    case baseServerAPI
    case baseSpriteURL
    case favoriteKey
    case notificationName
    
    var value: String {
        switch self {
        case .baseServerAPI: return "http://pokeapi.co/api/v2/"
        case .baseSpriteURL: return "https://img.pokemondb.net/artwork/[POKEMON_NAME].jpg"
        case .favoriteKey: return "favorites"
        case .notificationName: return "notificationReload"
        }
    }
}
