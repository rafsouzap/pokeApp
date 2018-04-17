//
//  PokemonDetailPresenter.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class PokemonDetailPresenter {
    
    fileprivate unowned let view: PokemonDetailViewProtocol
    fileprivate let service: PokemonService
    
    init(view: PokemonDetailViewProtocol) {
        self.view = view
        self.service = PokemonService()
    }
}

// MARK: - Public methods

extension PokemonDetailPresenter {
    
//    func loadPokemons(limit: Int = 20, offSet: Int = 0) {
//        
//        self.view.showLoading()
//        self.service.getPokemons(limit: limit, offSet: offSet, success: { result in
//            self.pokemons.append(contentsOf: result.compactMap { PokemonList(with: $0) })
//            self.view.reloadCollectionView()
//            self.view.hideLoading()
//        }, failure: { error in
//            self.requestError(errorDescription: error.description)
//        })
//    }
}

// MARK: - Private methods

extension PokemonDetailPresenter {
    
    fileprivate func requestError(errorDescription: String) {
        self.view.hideLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}

