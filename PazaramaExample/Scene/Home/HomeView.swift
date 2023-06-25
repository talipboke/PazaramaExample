//
//  HomeView.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import UIKit

final class HomeView: UIView {
    
    lazy var productListView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension HomeView {
    func setupUI() {
        addSubview(productListView)
        productListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productListView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            productListView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            productListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            productListView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: UIDimension.Spacing.medium)
        ])
    }
}
