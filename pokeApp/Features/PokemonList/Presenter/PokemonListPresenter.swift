//
//  PokemonListPresenter.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class PokemonListPresenter {
    
    fileprivate unowned let view: PokemonListViewProtocol
    fileprivate let service: PokemonService
    fileprivate(set) var pokemons: [Pokemon] = []
    
    init(view: PokemonListViewProtocol) {
        self.view = view
        self.service = PokemonService()
    }
}

// MARK: - Public methods

extension PokemonListPresenter {
    
    func loadPokemons() {
        
        self.view.showLoading()
        self.service.getPokemons(success: { result in
            print("aqui estou")
            self.view.hideLoading()
        }, failure: { error in
            self.requestError(errorDescription: error.description)
        })
        
    }
}

// MARK: - Private methods

extension PokemonListPresenter {

    fileprivate func requestError(errorDescription: String) {
        self.view.hideLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}

