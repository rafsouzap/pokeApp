//
//  FavoriteItemTableViewCell.swift
//  pokeApp
//
//  Created by Rafael de Paula on 19/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FavoriteItemTableViewCell: UITableViewCell, ViewCellExtension {

    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var favoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillOutlets(with pokemon: FavoriteList) {
        self.nameLabel.textColor = UIColor.titleColor()
        self.nameLabel.text = pokemon.name
        
        ImageLoader.shared.imageForUrl(urlString: pokemon.imageUrl.lowercased(), completion: { image, url in
            self.favoriteImageView.image = image
        })
    }
}
