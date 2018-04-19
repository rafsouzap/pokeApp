//
//  PokemonDetailTableViewCell.swift
//  pokeApp
//
//  Created by Rafael de Paula on 18/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class PokemonDetailTableViewCell: UITableViewCell, ViewCellExtension {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    fileprivate var tagValues = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(PokemonItemTagCollectionViewCell.cellNib, forCellWithReuseIdentifier: PokemonItemTagCollectionViewCell.id)

        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.estimatedItemSize = CGSize(width: 50, height: 30)
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionFlowLayout.scrollDirection = .horizontal
        
        self.collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
    }
    
    func fillOutlets(with values: [String]) {
        self.tagValues = values
        self.collectionView.reloadData()
    }
}

extension PokemonDetailTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tagValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonItemTagCollectionViewCell.id, for: indexPath) as! PokemonItemTagCollectionViewCell
        cell.backgroundColor = .clear
        cell.fillOutles(with: self.tagValues[indexPath.item].capitalized)
        return cell
    }
}
