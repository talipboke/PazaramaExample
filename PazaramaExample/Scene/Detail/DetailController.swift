//
//  DetailController.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

final class DetailController: UIViewController {
    private(set) lazy var detailView = DetailView()
    
    private var viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view = detailView
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapBackButton))
        detailView.backButton.addGestureRecognizer(tap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        observeViewModel()
        viewModel.viewDidLoad()
    }
}

private extension DetailController {
    func observeViewModel() {
        viewModel.didGetProduct = { [weak self] product in
            guard let self else { return }
            self.detailView.sliderView.setImages(with: product.images)
            self.detailView.titleLabel.text = product.name
            self.detailView.productDescriptionLabel.text = product.detailDescription
            self.detailView.bottomView.leftLabel.text = product.price
            self.detailView.featureListView.set(featureList: product.features)
        }
    }
    
    @objc
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
