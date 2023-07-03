//
//  VerticalFeatureListView.swift
//  PazaramaExample
//
//  Created by Talip on 3.07.2023.
//

import UIKit

final class VerticalFeatureListView: UIStackView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init(coder: NSCoder) {  fatalError("init(coder:) has not been implemented") }

    func set(featureList: [ProductFeature]) {
        for feature in featureList {
            let featureView =  FeatureView(feature: feature)
            addArrangedSubview(featureView)
        }
    }
}

private extension VerticalFeatureListView {
    func setupUI() {
        axis = .vertical
        spacing = 0
    }
}

final class FeatureView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var feature: ProductFeature
    
    init(feature: ProductFeature) {
        self.feature = feature
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension FeatureView {
    func setupUI() {
        addSubview(titleLabel)
        addSubview(featureLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: UIDimension.Spacing.medium),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIDimension.Spacing.xsmall),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIDimension.Spacing.xsmall),
            
            featureLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            featureLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -UIDimension.Spacing.medium)
        ])
        
        titleLabel.text = feature.title
        featureLabel.text = feature.value
    }
}


