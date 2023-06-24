//
//  ReuseIdentifier.swift
//  BaseFoundation
//
//  Created by Talip on 25.03.2022.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

