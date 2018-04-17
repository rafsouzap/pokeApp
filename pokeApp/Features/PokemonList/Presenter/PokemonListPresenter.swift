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
    fileprivate(set) var pokemons: [PokemonList] = []
    
    init(view: PokemonListViewProtocol) {
        self.view = view
        self.service = PokemonService()
    }
}

// MARK: - Public methods

extension PokemonListPresenter {
    
    func loadPokemons(limit: Int = 20, offSet: Int = 0) {
        
        self.view.showLoading()
        self.service.getPokemons(limit: limit, offSet: offSet, success: { result in
            self.pokemons.append(contentsOf: result.compactMap { PokemonList(with: $0) })
            self.view.reloadCollectionView()
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
