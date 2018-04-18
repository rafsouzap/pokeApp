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
    @IBOutlet fileprivate weak var tableView: UITableView!
    
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
        self.tableView.sectionFooterHeight = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        self.setupSizes()
    }
}

// MARK: - UITableViewDataSource

extension PokemonDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailTableViewCell.id, for: indexPath) as! PokemonDetailTableViewCell
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PokemonDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let contentView = UIView(frame: CGRect(x: 10, y: 0, width: self.view.bounds.width - 20, height: 30))
        
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
    
    func showDetail(with pokemon: PokemonDetail) {
        
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
    }
    
    fileprivate func setupLayout() {
        self.view.backgroundColor = UIColor.viewBackgroundColor()
        self.headerContainerView.backgroundColor = UIColor.contentColor()
    }
    
    fileprivate func setupSizes() {
        self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.height / 2
    }
}
