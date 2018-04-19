//
//  DefaultsManager.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct DefaultsManager {
    
    fileprivate static let userDefaults = UserDefaults.standard
    
    static func saveFavorite(name: String) {
        
        var favorites = self.userDefaults.object(forKey: AppEnvironment.favoriteKey.value) as? [String] ?? [String]()
        
        if let favoriteIndex = favorites.index(of: name) {
            favorites.remove(at: favoriteIndex)
        } else {
            favorites.append(name)
        }
        self.saveValue(to: AppEnvironment.favoriteKey.value, value: favorites)
    }
    
    static func isFavorite(name: String) -> Bool {
        let favorites = self.userDefaults.object(forKey: AppEnvironment.favoriteKey.value) as? [String] ?? [String]()
        return favorites.contains(name)
    }
    
    static func retrieveFavorites() -> [String] {
        let favorites = self.userDefaults.object(forKey: AppEnvironment.favoriteKey.value) as? [String] ?? [String]()
        return favorites
    }
    
    fileprivate static func saveValue(to key: String, value: Any) {
        userDefaults.set(value, forKey: key)
    }
}
