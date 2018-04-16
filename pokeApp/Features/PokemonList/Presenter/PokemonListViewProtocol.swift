//
//  PokemonListViewProtocol.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol PokemonListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadCollectionView()
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
