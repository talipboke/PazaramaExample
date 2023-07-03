//
//  ViewController.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import UIKit
import BaseFoundation
import CommonComponents

protocol HomeControllerDelegate: AnyObject {
    func didSelect(product: ProductModel, index: Int)
}

final class HomeController: UIViewController {
    private(set) lazy var homeView = HomeView()
    private(set) lazy var listController = UIFactory.makeCollectionViewController(dataSource: dataSource, delegate: self)
    private(set) lazy var searchController = makeSearchController()
    
    private let dataSource: ProductListDataSource
    private var viewModel: HomeViewModelProtocol
    weak var delegate: HomeControllerDelegate?
    
    init(dataSource: ProductListDataSource = .init(productList: []),
         viewModel: HomeViewModelProtocol) {
        self.dataSource = dataSource
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view = homeView
        navigationController?.navigationBar.prefersLargeTitles = true
        addSubControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
        viewModel.getAllProducts()
    }
}

private extension HomeController {
    func addSubControllers() {
        addLogo()
        addAddToCardButton()
        navigationItem.searchController = searchController
        add(listController, to: homeView.productListView)
    }
    
    func addLogo() {
        let customView = UIFactory.makeBarButtonView(imageName: "logo", frame: CGRect(x: 0, y: UIDimension.Spacing.medium, width: 152, height: UIDimension.Spacing.xlarge))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
    }
    
    func addAddToCardButton() {
        let customView = UIFactory.makeBarButtonView(imageName: "addToCard", frame: CGRect(x: 0, y: UIDimension.Spacing.small, width: UIDimension.Spacing.xlarge, height: UIDimension.Spacing.large))
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAddToCard))
        customView.addGestureRecognizer(tap)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customView)
    }
    
    @objc
    func didTapAddToCard() {
        print("clicked")
    }
    
    func makeSearchController() -> SearchViewController {
        let controller = SearchViewController(minCountToSearch: viewModel.minCountToSearch,
                                              placeHolderText: AppConst.searchBarPlaceHolderText.text())
        controller.didUpdateText = { [weak self] searchedText in
            self?.viewModel.search(with: searchedText)
        }

        controller.didClear = { [weak self] in
            self?.viewModel.clear()
        }

        return controller
    }
    
    func observeViewModel() {
        viewModel.didChangeList = { [weak self] list in
            self?.reload(with: list)
        }
    }
    
    func reload(with productList: [ProductModel]) {
        dataSource.productList = productList
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.listController.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDimension.calculateSearchItemSize(collectionView: collectionView)
    }
}

extension HomeController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(product: dataSource.productList[indexPath.row], index: indexPath.row)
    }
}
