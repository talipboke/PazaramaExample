//
//  UIFactory.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import UIKit
import CommonComponents

final class UIFactory {
    static func makeCollectionViewController(dataSource: CollectionListViewDataSource,
                                             delegate: UICollectionViewDelegate? = nil,
                                             layout: UICollectionViewFlowLayout = .init()) -> CollectionListViewController {
        let layout = layout
        let insets = UIEdgeInsets(top: .zero,
                                  left: UIDimension.Spacing.medium,
                                  bottom: .zero,
                                  right: UIDimension.Spacing.medium)
        layout.sectionInset = insets
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = UIDimension.Spacing.medium
        layout.minimumLineSpacing = UIDimension.Spacing.medium
        let collectionView = CollectionListViewController(dataSource: dataSource,
                                                          delegate: delegate,
                                                          layout: layout)
        return collectionView
    }
    
    static func makeImageView(contentMode: UIView.ContentMode = .scaleToFill) -> UIImageView {
        let image = UIImageView()
        image.contentMode = contentMode
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        return image
    }
    
    static func makeProductNameLabel(isMultiline: Bool = true) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = isMultiline ? 0 : 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }
    
    static func makeAddCardButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .magenta
        button.setTitle(AppConst.addToCard.text(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        return button
    }
    
    static func makeBarButtonView(imageName: String, frame: CGRect) -> UIView {
        if let originalImage = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) {
            let imageView = UIImageView(image: originalImage)
            imageView.contentMode = .center
            imageView.frame = frame
            imageView.isUserInteractionEnabled = false
            let containerView = UIView(frame: imageView.frame)
            containerView.addSubview(imageView)
            return containerView
        } else {
            return UIView()
        }
    }
    
    static func makeSeperatorView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = UIColor.seperatorGray
        return view
    }
    
    static func makeInnerTitleLabel(text: String = "", alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.text = text
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
