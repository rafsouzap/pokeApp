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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension PokemonDetailTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        
        
        cell.backgroundColor = .black
        return cell
    }
}
