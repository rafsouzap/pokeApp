//
//  UIColorExtension.swift
//  pokeApp
//
//  Created by Rafael de Paula on 14/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UIColor {

    static func viewBackgroundColor() -> UIColor {
        return self.init(hexadecimal: 0xF6F6F6)
    }
    
    static func navigationTintColor() -> UIColor {
        return self.init(hexadecimal: 0xFFFFFF)
    }
    
    static func navigationBarTintColor() -> UIColor {
        return self.init(hexadecimal: 0x233D4D)
    }
    
    static func titleColor() -> UIColor {
        return self.init(hexadecimal: 0x233D4D)
    }
    
    static func contentColor() -> UIColor {
        return self.init(hexadecimal: 0xA1C181)
    }
    
    static func detailTitleColor() -> UIColor {
        return self.init(hexadecimal: 0xC94707)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red value")
        assert(green >= 0 && green <= 255, "Invalid green value")
        assert(blue >= 0 && blue <= 255, "Invalid blue value")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexadecimal: Int) {
        self.init(red:(hexadecimal >> 16) & 0xff, green:(hexadecimal >> 8) & 0xff, blue:hexadecimal & 0xff)
    }
}
