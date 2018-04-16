//
//  NSObjectExtension.swift
//  pokeApp
//
//  Created by Rafael de Paula on 14/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

protocol Identifying {
    static var identifier: String { get }
}

extension Identifying where Self: NSObject {
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying { }
