//
//  UICollectionView+Extensions.swift
//  BaseFoundation
//
//  Created by Talip on 25.03.2022.
//

import UIKit

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(withClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Cell must be registered")
        }
        return cell
    }
}
