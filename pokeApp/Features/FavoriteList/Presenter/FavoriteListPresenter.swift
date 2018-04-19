//
//  FavoriteListPresenter.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class FavoriteListPresenter {
    
    fileprivate unowned let view: FavoriteListViewProtocol
    fileprivate(set) var pokemons: [FavoriteList] = []
    
    init(view: FavoriteListViewProtocol) {
        self.view = view
    }
}

// MARK: - Public methods

extension FavoriteListPresenter {
    
    func loadFavorites() {
        self.pokemons = DefaultsManager.retrieveFavorites().map { FavoriteList(with: $0) }
        self.view.reloadTableView()
    }
    
    func removeFavorite(with pokemonName: String) {
        DefaultsManager.saveFavorite(name: pokemonName)
        self.loadFavorites()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppEnvironment.notificationName.value), object: nil)
    }
}

// MARK: - Private methods

extension FavoriteListPresenter {
    
    fileprivate func requestError(errorDescription: String) {
        self.view.hideLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}

