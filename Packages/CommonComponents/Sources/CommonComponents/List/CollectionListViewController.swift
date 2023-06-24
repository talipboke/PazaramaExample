//
//  CollectionListViewController.swift
//  CommonComponents
//
//  Created by Talip on 25.03.2022.
//

import UIKit

public final class CollectionListViewController: UIViewController {
    private(set) public lazy var collectionView: UICollectionView = makeCollectionView()
    private(set) public var dataSource: CollectionListViewDataSource
    private(set) public weak var delegate: UICollectionViewDelegate?
    private(set) public var layout: UICollectionViewLayout

    public init(dataSource: CollectionListViewDataSource,
                delegate: UICollectionViewDelegate? = nil,
                layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }

    public override func loadView() {
        super.loadView()
        view = collectionView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureCollectionView()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension CollectionListViewController {
    func configureCollectionView() {
        dataSource.registerCells(to: collectionView)
        collectionView.dataSource = self.dataSource
        collectionView.delegate = self.delegate
    }

    func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }
}

public protocol CollectionListViewDataSource: UICollectionViewDataSource {
    func registerCells(to collectionView: UICollectionView)
}
