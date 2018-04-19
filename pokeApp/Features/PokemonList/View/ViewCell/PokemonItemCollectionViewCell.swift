//
//  PokemonItemCollectionViewCell.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class PokemonItemCollectionViewCell: UICollectionViewCell, ViewCellExtension {

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var favoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = false
        self.layer.cornerRadius = 10.0
        self.layer.shadowOpacity = 0.35
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func fillOutlets(with pokemon: PokemonList) {
        self.nameLabel.textColor = UIColor.titleColor()
        self.nameLabel.text = pokemon.name

        ImageLoader.shared.imageForUrl(urlString: pokemon.imageUrl, completion: { image, url in
            self.imageView.image = image
        })
        
        self.favoriteImageView.isHidden = !DefaultsManager.isFavorite(name: pokemon.name)
    }
}
