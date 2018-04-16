//
//  PokemonCollectionFlowLayout.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class PokemonCollectionFlowLayout: UICollectionViewFlowLayout {
    
    let itemWidth: CGFloat = 96
    let itemHeight: CGFloat = 120
    
    override init() {
        super.init()
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    override var itemSize: CGSize {
        set { self.itemSize = CGSize(width: self.itemWidth, height: self.itemHeight)}
        get { return CGSize(width: self.itemWidth, height: self.itemHeight)}
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
    private func setupLayout() {
        let screenWidth = UIScreen.main.bounds.width
        let itemsWidth = self.itemWidth * 3
        let marginSpacing = (screenWidth - itemsWidth) / 4
        
        self.minimumLineSpacing = marginSpacing
        self.sectionInset = UIEdgeInsetsMake(marginSpacing, marginSpacing, marginSpacing, marginSpacing)
        self.scrollDirection = .vertical
        self.sectionInsetReference = .fromContentInset
    }
}
