//
//  PokemonDetailViewController.swift
//  pokeApp
//
//  Created by Rafael de Paula on 17/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class PokemonDetailViewController: UIViewController {

    @IBOutlet fileprivate weak var headerContainerView: UIView!
    @IBOutlet fileprivate weak var imageContainerView: UIView!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var weightLabel: UILabel!
    @IBOutlet fileprivate weak var heightLabel: UILabel!
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var favoriteButton: UIButton!
    
    fileprivate let viewCellList = "listCell"
    
    fileprivate var presenter: PokemonDetailPresenter!
    var selectedPokemon: PokemonList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokémon"
        self.initialize()
        
        guard let pokemon = self.selectedPokemon else {
            fatalError("selectedPokemon can't be nil")
        }
        self.presenter.loadDetail(with: pokemon.name)
        
        self.tableView.register(PokemonDetailTableViewCell.cellNib, forCellReuseIdentifier: PokemonDetailTableViewCell.id)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.viewCellList)
        self.tableView.sectionFooterHeight = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupLayout()
        self.deviceOrientation()
    }
    
    override func viewDidLayoutSubviews() {
        self.setupSizes()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.deviceOrientation()
    }
}

// MARK: - IBActions

extension PokemonDetailViewController {
    
    @IBAction func favoriteButtonTouched(_ sender: UIButton) {
        
        guard let pokemon = self.selectedPokemon else {
            fatalError("selectedPokemon can't be nil")
        }
        self.presenter.saveFavorite(with: pokemon.name)
    }
}

// MARK: - UITableViewDataSource

extension PokemonDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let detail = self.presenter.pokemonDetail else {
            return 0
        }
        
        if section == 2 { return detail.moves.count }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let detail = self.presenter.pokemonDetail else {
            fatalError("pokemonDetail can't be nil")
        }
        
        if indexPath.section == 2 {
            let listCell = tableView.dequeueReusableCell(withIdentifier: self.viewCellList, for: indexPath)
            listCell.backgroundColor = .clear
            listCell.textLabel?.text = detail.moves[indexPath.row].move.name.capitalized
            listCell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            listCell.textLabel?.textColor = UIColor.titleColor()
            return listCell
        }
        
        let tagCell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailTableViewCell.id, for: indexPath) as! PokemonDetailTableViewCell
        
        if indexPath.section == 0 {
            let types = detail.types.map { $0.type.name }
            tagCell.fillOutlets(with: types)
        }
        else if indexPath.section == 1 {
            let abilities = detail.abilities.map { $0.ability.name }
            tagCell.fillOutlets(with: abilities)
        }
        return tagCell
    }
}

// MARK: - UITableViewDelegate

extension PokemonDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 { return 25 }
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let contentView = UIView(frame: CGRect(x: 10, y: 0, width: self.view.bounds.width - 20, height: 30))
        contentView.backgroundColor = UIColor.viewBackgroundColor()
        
        let separator = UIView(frame: CGRect(x: 10, y: contentView.bounds.height - 4, width: contentView.bounds.width, height: 2))
        separator.backgroundColor = UIColor.titleColor()
        contentView.addSubview(separator)
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: contentView.bounds.width, height: contentView.bounds.height))
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        titleLabel.textColor = UIColor.titleColor()
        
        switch section {
        case 0: titleLabel.text = "TYPES"
        case 1: titleLabel.text = "ABILITIES"
        case 2: titleLabel.text = "MOVES"
        default: break
        }
        
        contentView.addSubview(titleLabel)
        return contentView
    }
}

// MARK: - ViewProtocol

extension PokemonDetailViewController: PokemonDetailViewProtocol {
    
    func showDetail() {
        
        guard let detail = self.presenter.pokemonDetail else {
            fatalError("pokemonDetail can't be nil")
        }
        self.weightLabel.text = "Weight: \(detail.weight)\""
        self.heightLabel.text = "Height: \(detail.height)\""
        self.tableView.reloadData()
    }
    
    func changeFavoriteLayout(isFavorite: Bool) {
        
        if isFavorite {
            self.favoriteButton.setTitle("REMOVE FAVORITE", for: .normal)
            self.favoriteButton.setTitleColor(UIColor.white, for: .normal)
            self.favoriteButton.layer.borderWidth = 0
            self.favoriteButton.backgroundColor = UIColor.favoriteTintColor()
        } else {
            self.favoriteButton.setTitle("ADD FAVORITE", for: .normal)
            self.favoriteButton.setTitleColor(UIColor.titleColor(), for: .normal)
            self.favoriteButton.layer.borderWidth = 1
            self.favoriteButton.layer.borderColor = UIColor.titleColor().cgColor
            self.favoriteButton.backgroundColor = UIColor.white
        }
    }
    
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
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Private methods

extension PokemonDetailViewController {
    
    fileprivate func initialize() {
        
        guard let pokemon = self.selectedPokemon else {
            fatalError("selectedPokemon can't be nil")
        }
        self.nameLabel.text = pokemon.name

        ImageLoader.shared.imageForUrl(urlString: pokemon.imageUrl, completion: { image, url in
            self.imageView.image = image
        })
        
        self.presenter = PokemonDetailPresenter(view: self)
        self.presenter.isFavorite(with: pokemon.name)
    }
    
    fileprivate func setupLayout() {
        self.view.backgroundColor = UIColor.viewBackgroundColor()
        self.headerContainerView.backgroundColor = UIColor.contentColor()
        self.favoriteButton.layer.cornerRadius = self.favoriteButton.bounds.height / 2
    }
    
    fileprivate func setupSizes() {
        self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.height / 2
    }
    
    fileprivate func deviceOrientation() {
        if  UIDevice.current.orientation.isLandscape {
            self.nameLabel.textAlignment = .center
            self.weightLabel.textAlignment = .center
            self.heightLabel.textAlignment = .center
        } else {
            self.nameLabel.textAlignment = .left
            self.weightLabel.textAlignment = .left
            self.heightLabel.textAlignment = .left
        }
    }
}
