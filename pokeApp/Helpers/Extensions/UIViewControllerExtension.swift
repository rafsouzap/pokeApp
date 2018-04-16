//
//  UIStoryboardExtension.swift
//  pokeApp
//
//  Created by Rafael de Paula on 14/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

protocol StoryboardInstantiate {
    static func storyboardViewController(with nibName: String) -> Self
}

extension StoryboardInstantiate where Self: UIViewController {
    
    static func storyboardViewController(with nibName: String) -> Self {
        
        let storyboard = UIStoryboard(name: nibName, bundle: nil)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: Self.identifier) as? Self else {
            fatalError("Couldn't instantiate initial storyboard with Nib name: \(nibName)")
        }
        return controller
    }
}

extension UIViewController: StoryboardInstantiate { }
