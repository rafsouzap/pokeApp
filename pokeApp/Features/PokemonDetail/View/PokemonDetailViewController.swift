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

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var headerContainerView: UIView!
    @IBOutlet fileprivate weak var imageContainerView: UIView!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    
    fileprivate var presenter: PokemonDetailPresenter!
    var selectedPokemon: PokemonList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokémon"
        self.initialize()
        self.setupLayout()
        
        //XPTO XPTO XPTO XPTO
        self.nameLabel.text = self.selectedPokemon?.name
        
        ImageLoader.shared.imageForUrl(urlString: self.selectedPokemon!.imageUrl, completion: { image, url in
            self.imageView.image = image
        })
    }
    
    override func viewDidLayoutSubviews() {
        self.setupSizes()
    }
}

// MARK: - ViewProtocol

extension PokemonDetailViewController: PokemonDetailViewProtocol {
    
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
        self.presenter = PokemonDetailPresenter(view: self)
    }
    
    fileprivate func setupLayout() {
        self.headerContainerView.backgroundColor = UIColor.contentColor()
    }
    
    fileprivate func setupSizes() {
        self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.height / 2
    }
}
