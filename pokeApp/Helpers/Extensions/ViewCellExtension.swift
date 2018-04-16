//
//  ViewCellExtension.swift
//  pokeApp
//
//  Created by Rafael de Paula on 15/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

protocol ViewCellExtension {
    static var id: String { get }
    static var cellNib: UINib { get }
}

extension ViewCellExtension {
    static var id: String { return String(describing: Self.self) }
    static var cellNib: UINib { return UINib(nibName: id, bundle: nil) }
}
