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
    
    func loadDetail(with name: String) {
        
        let lowerName = name.lowercased()
        
        self.view.showLoading()
        self.service.getPokemonDetail(with: lowerName, success: { result in
            self.view.showDetail(with: result)
            self.view.hideLoading()
        }, failure: { error in
            self.requestError(errorDescription: error.description)
        })
        
    }
}

// MARK: - Private methods

extension PokemonDetailPresenter {
    
    fileprivate func requestError(errorDescription: String) {
        self.view.hideLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}
