//
//  PokemonDetailPresenter.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class PokemonDetailPresenter {
    
    fileprivate unowned let view: PokemonDetailViewProtocol
    fileprivate let service: PokemonService
    fileprivate(set) var pokemonDetail: PokemonDetail?
    
    init(view: PokemonDetailViewProtocol) {
        self.view = view
        self.service = PokemonService()
    }
}

// MARK: - Public methods

extension PokemonDetailPresenter {
    
    func loadDetail(with name: String) {
        
        let lowerName = name.lowercased()
        
        self.view.showLoading()
        self.service.getPokemonDetail(with: lowerName, success: { result in
            self.pokemonDetail = result
            self.view.showDetail()
            self.view.hideLoading()
        }, failure: { error in
            self.requestError(errorDescription: error.description)
        })
        
    }
    
    func saveFavorite(with pokemonName: String) {
        DefaultsManager.saveFavorite(name: pokemonName)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppEnvironment.notificationName.value), object: nil)
        self.isFavorite(with: pokemonName)
    }
    
    func isFavorite(with pokemonName: String) {
        self.view.changeFavoriteLayout(isFavorite: DefaultsManager.isFavorite(name: pokemonName))
    }
}

// MARK: - Private methods

extension PokemonDetailPresenter {
    
    fileprivate func requestError(errorDescription: String) {
        self.view.hideLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}
