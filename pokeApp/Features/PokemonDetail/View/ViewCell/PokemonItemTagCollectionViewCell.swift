//
//  PokemonItemTagCollectionViewCell.swift
//  pokeApp
//
//  Created by Rafael de Paula on 18/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

class PokemonItemTagCollectionViewCell: UICollectionViewCell, ViewCellExtension {

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.containerView.backgroundColor = UIColor.tagBackgroundColor()
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.masksToBounds = true
    }

    func fillOutles(with tag: String) {
        self.tagLabel.text = tag
    }
}
