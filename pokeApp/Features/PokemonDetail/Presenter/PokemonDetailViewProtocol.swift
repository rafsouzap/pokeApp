//
//  PokemonDetailViewProtocol.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol PokemonDetailViewProtocol: class {
    func showDetail()
    func changeFavoriteLayout(isFavorite: Bool)
    func showLoading()
    func hideLoading()
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
