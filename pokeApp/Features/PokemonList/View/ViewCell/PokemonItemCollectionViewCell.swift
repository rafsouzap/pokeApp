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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillOutlets(with pokemon: PokemonList) {
        self.nameLabel.textColor = UIColor.titleColor()
        self.nameLabel.text = pokemon.name

        ImageLoader.shared.imageForUrl(urlString: pokemon.imageUrl, completion: { image, url in
            self.imageView.image = image
        })
    }
}
