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
        return 14
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonItemCollectionViewCell.id, for: indexPath) as! PokemonItemCollectionViewCell
        cell.fillOutlets(with: "Teste \(indexPath.row)")
        return cell
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
        
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        
    }
}

// MARK: - Private methods

extension PokemonListViewController {
    
    fileprivate func initialize() {
        self.presenter = PokemonListPresenter(view: self)
    }
}
