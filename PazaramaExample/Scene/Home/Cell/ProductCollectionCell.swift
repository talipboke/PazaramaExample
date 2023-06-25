//
//  ProductCollectionCell.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import UIKit
import BaseFoundation

final class ProductCollectionCell: UICollectionViewCell {
    lazy var productImageView = UIFactory.makeImageView()
    lazy var productNameLabel = UIFactory.makeProductNameLabel()
    lazy var priceLabel = UIFactory.makePriceLabel()
    lazy var addToCardButton = UIFactory.makeAddCardButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configureCell(with model: ProductModel) {
        productNameLabel.text = model.name
        priceLabel.text = model.price
        if let urlString = model.images.first, let url = URL(string: urlString) {
            productImageView.setImage(with: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        productNameLabel.text = nil
        priceLabel.text = nil
    }
}

// MARK: - Private Methods
private extension ProductCollectionCell {
    func setupUI() {
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = UIDimension.Spacing.small
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addToCardButton)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            productImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor, multiplier: 1.4),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: UIDimension.Spacing.xsmall),
            productNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UIDimension.Spacing.medium),
            productNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -UIDimension.Spacing.medium),
            productNameLabel.heightAnchor.constraint(equalToConstant: UIDimension.Spacing.xlarge),
            
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            priceLabel.leftAnchor.constraint(equalTo: productNameLabel.leftAnchor),
            priceLabel.rightAnchor.constraint(equalTo: productNameLabel.rightAnchor),
            
            addToCardButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            addToCardButton.leftAnchor.constraint(equalTo: priceLabel.leftAnchor),
            addToCardButton.rightAnchor.constraint(equalTo: priceLabel.rightAnchor),
            addToCardButton.heightAnchor.constraint(equalToConstant: UIDimension.Spacing.xlarge),
            //addToCardButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIDimension.Spacing.medium)
        ])
        
        productImageView.layer.cornerRadius = UIDimension.Spacing.small
    }
}
