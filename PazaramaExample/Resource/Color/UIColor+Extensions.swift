//
//  UIColor+Extensions.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import UIKit

extension UIColor {
    
    @nonobjc public class var magenta: UIColor {
        return UIColor(r: 255, g: 0, b: 139)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }
}


