//
//  FavoriteListTableViewController.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class FavoriteListTableViewController: UITableViewController {

    fileprivate var presenter: FavoriteListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.initialize()
        self.presenter.loadFavorites()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReload(notification:)),
                                               name: NSNotification.Name(rawValue: AppEnvironment.notificationName.value), object: nil)
    }
}

// MARK: - UITableViewDataSource

extension FavoriteListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if self.presenter.pokemons.count > 0 {
            return 1
        }        
        self.emptyView()
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteItemTableViewCell.id, for: indexPath) as! FavoriteItemTableViewCell
        
        let pokemon = self.presenter.pokemons[indexPath.row]
        cell.fillOutlets(with: pokemon)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = self.presenter.pokemons[indexPath.row]
        let controller = PokemonDetailViewController.storyboardViewController(with: "Main")
        controller.selectedPokemon = PokemonList(with: selectedPokemon.name)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedPokemon = self.presenter.pokemons[indexPath.row]
            self.presenter.removeFavorite(with: selectedPokemon.name)
        }
    }
}

// MARK: - ViewProtocol

extension FavoriteListTableViewController: FavoriteListViewProtocol {
    
    func showLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.lightGray)
        SVProgressHUD.setBackgroundColor(.darkGray)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func reloadTableView() {
        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.tableView.reloadData()
        })
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Private methods

extension FavoriteListTableViewController {
    
    fileprivate func initialize() {
        self.presenter = FavoriteListPresenter(view: self)
        self.view.backgroundColor = UIColor.viewBackgroundColor()
    }
    
    @objc fileprivate func notificationReload(notification: NSNotification) {
        self.presenter.loadFavorites()
    }
    
    fileprivate func emptyView() {
     
        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let emptyLabel = UILabel(frame: frame)
        emptyLabel.text = "You don't have any favorite Pokémon."
        emptyLabel.textColor = UIColor.darkGray
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        emptyLabel.sizeToFit()
        
        self.tableView.backgroundView = emptyLabel
        self.tableView.separatorStyle = .none
    }
}
