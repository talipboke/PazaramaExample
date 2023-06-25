//
//  UIImageView+Extensions.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import Kingfisher
import UIKit

/// Used for Abstract ImageCache third parties from codebase
extension UIImageView {
    func setImage(with url: URL) {
        self.kf.setImage(with: url)
    }
}
