//
//  PokemonItemCollectionViewCell.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

class PokemonItemCollectionViewCell: UICollectionViewCell, ViewCellExtension {

    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillOutlets(with text: String) {
        self.nameLabel.text = text
    }
}
