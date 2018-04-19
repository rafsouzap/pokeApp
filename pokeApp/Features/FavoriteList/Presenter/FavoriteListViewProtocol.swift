//
//  FavoriteListViewProtocol.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol FavoriteListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
