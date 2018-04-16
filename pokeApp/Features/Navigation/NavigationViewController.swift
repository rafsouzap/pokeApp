//
//  NavigationViewController.swift
//  pokeApp
//
//  Created by Rafael de Paula on 14/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.navigationBar.tintColor = UIColor.navigationTintColor()
        self.navigationBar.barTintColor = UIColor.navigationBarTintColor()
        self.navigationBar.isTranslucent = false
        
        let textAttributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 20) ?? UIFont.systemFont(ofSize: 17, weight: .medium),
                              NSAttributedStringKey.foregroundColor: UIColor.navigationTintColor()]
        
        self.navigationBar.titleTextAttributes = textAttributes
    }
}
