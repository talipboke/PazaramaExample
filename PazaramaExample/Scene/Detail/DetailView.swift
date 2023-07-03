//
//  DetailView.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

final class DetailView: UIView {
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sliderView: SliderView = {
        let view = SliderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var upperSeperator = UIFactory.makeSeperatorView()
    
    lazy var productDescriptionTitleLabel = UIFactory.makeInnerTitleLabel(text: AppConst.productDescription.text())
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomSeperator = UIFactory.makeSeperatorView()
    
    private lazy var productFeaturesTitleLabel = UIFactory.makeInnerTitleLabel(text: AppConst.productFeatures.text())
    
    lazy var featureListView: VerticalFeatureListView = {
        let view = VerticalFeatureListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomView: BottomView = {
        let view = BottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension DetailView {
    func setupUI() {
        addSubview(scrollView)
        addSubview(backButton)
        scrollView.addSubview(contentView)
        contentView.addSubview(sliderView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(upperSeperator)
        contentView.addSubview(productDescriptionTitleLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(bottomSeperator)
        contentView.addSubview(productFeaturesTitleLabel)
        contentView.addSubview(featureListView)
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: UIDimension.Spacing.xlarge),
            backButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: UIDimension.Spacing.medium),
            backButton.widthAnchor.constraint(equalToConstant: UIDimension.Spacing.large),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            
            scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            sliderView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            sliderView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            sliderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sliderView.heightAnchor.constraint(equalTo: sliderView.widthAnchor, multiplier: 1.45),
            
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UIDimension.Spacing.medium),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -UIDimension.Spacing.medium),
            titleLabel.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: UIDimension.Spacing.medium),
            
            upperSeperator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UIDimension.Spacing.medium),
            upperSeperator.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            upperSeperator.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            productDescriptionTitleLabel.topAnchor.constraint(equalTo: upperSeperator.bottomAnchor, constant: UIDimension.Spacing.large),
            productDescriptionTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            productDescriptionTitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productDescriptionTitleLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            productDescriptionLabel.leftAnchor.constraint(equalTo: productDescriptionTitleLabel.leftAnchor),
            productDescriptionLabel.rightAnchor.constraint(equalTo: productDescriptionTitleLabel.rightAnchor),
            
            bottomSeperator.leftAnchor.constraint(equalTo: upperSeperator.leftAnchor),
            bottomSeperator.rightAnchor.constraint(equalTo: upperSeperator.rightAnchor),
            bottomSeperator.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: UIDimension.Spacing.large),
            
            productFeaturesTitleLabel.leftAnchor.constraint(equalTo: productDescriptionTitleLabel.leftAnchor),
            productFeaturesTitleLabel.rightAnchor.constraint(equalTo: productDescriptionTitleLabel.rightAnchor),
            productFeaturesTitleLabel.topAnchor.constraint(equalTo: bottomSeperator.bottomAnchor, constant: UIDimension.Spacing.medium),
            
            featureListView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            featureListView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            featureListView.topAnchor.constraint(equalTo: productFeaturesTitleLabel.bottomAnchor, constant: UIDimension.Spacing.medium),
            featureListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
    }
}


