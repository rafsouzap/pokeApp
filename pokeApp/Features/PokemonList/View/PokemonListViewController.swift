//
//  PokemonListViewController.swift
//  pokeApp
//
//  Created by Rafael de Paula on 14/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

final class PokemonListViewController: UIViewController {

    @IBOutlet weak fileprivate var collectionView: UICollectionView!
    
    fileprivate var presenter: PokemonListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokémon"
        self.initialize()
        
        self.collectionView.register(PokemonItemCollectionViewCell.cellNib, forCellWithReuseIdentifier: PokemonItemCollectionViewCell.id)
        self.presenter.loadPokemons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.backgroundColor = UIColor.viewBackgroundColor()
    }
}

// MARK: UICollectionViewDataSource

extension PokemonListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.pokemons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonItemCollectionViewCell.id, for: indexPath) as! PokemonItemCollectionViewCell
        
        let pokemon = self.presenter.pokemons[indexPath.row]
        cell.fillOutlets(with: pokemon)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension PokemonListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let countPokemons = self.presenter.pokemons.count
        
        if countPokemons - 1 == indexPath.row
            && countPokemons % 20 == 0 {
            self.presenter.loadPokemons(limit: 20, offSet: countPokemons)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PokemonDetailViewController.storyboardViewController(with: "Main")
        controller.selectedPokemon = self.presenter.pokemons[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - ViewProtocol

extension PokemonListViewController: PokemonListViewProtocol {
    
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
    
    func reloadCollectionView() {
        UIView.transition(with: self.collectionView, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.collectionView.reloadData()
        })
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Private methods

extension PokemonListViewController {
    
    fileprivate func initialize() {
        self.presenter = PokemonListPresenter(view: self)
    }
}
