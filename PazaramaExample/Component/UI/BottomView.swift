//
//  BottomView.swift
//  PazaramaExample
//
//  Created by Talip on 3.07.2023.
//

import UIKit

final class BottomView: UIView {
    lazy var leftLabel = UIFactory.makePriceLabel()
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle(AppConst.addToCard.text(), for: .normal)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension BottomView {
    func setupUI() {
        backgroundColor = .white
        addSubview(leftLabel)
        addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            leftLabel.centerYAnchor.constraint(equalTo: rightButton.centerYAnchor),
            leftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: UIDimension.Spacing.medium),
            
            rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -UIDimension.Spacing.medium),
            rightButton.topAnchor.constraint(equalTo: topAnchor, constant: UIDimension.Spacing.medium),
            rightButton.heightAnchor.constraint(equalToConstant: 42),
            rightButton.widthAnchor.constraint(equalToConstant: 178),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIDimension.Spacing.medium)
        ])
    }
}
