//
//  UIDimension.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import UIKit

/// Defines the standarts of the Releated Application's User Interface
enum UIDimension {
    public enum Spacing {
        /// 4px
        public static let xsmall: CGFloat = 4
        /// 8px
        public static let small: CGFloat = 8
        /// 16px
        public static let medium: CGFloat = 16
        /// 24px
        public static let large: CGFloat = 24
        /// 32px
        public static let xlarge: CGFloat = 32
        /// 40px
        public static let xxlarge: CGFloat = 40
        /// 48px
        public static let xxxlarge: CGFloat = 48
    }
}

extension UIDimension {
    static func calculateSearchItemSize(collectionView: UICollectionView) -> CGSize {
        let totalHorizontalInsets: CGFloat = (UIDimension.Spacing.medium * 2) + UIDimension.Spacing.medium
        let width = (collectionView.bounds.width - totalHorizontalInsets) / 2
        let height = width * 2.15
        return CGSize(width: width, height: height)
    }
}

