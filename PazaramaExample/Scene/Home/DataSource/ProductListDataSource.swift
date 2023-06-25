//
//  ProductListDataSource.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import UIKit
import BaseFoundation
import CommonComponents

final class ProductListDataSource: NSObject, CollectionListViewDataSource {
    var productList: [ProductModel]
    
    init(productList: [ProductModel]) {
        self.productList = productList
    }
    
    func registerCells(to collectionView: UICollectionView) {
        collectionView.register(ProductCollectionCell.self,
                                forCellWithReuseIdentifier: ProductCollectionCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: ProductCollectionCell.self, for: indexPath)
        cell.configureCell(with: productList[indexPath.row])
        return cell
    }
}
