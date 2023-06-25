//
//  ProductModel.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct ProductModel: DatabaseEntity {
    @DocumentID var id: String?
    let name: String
    let price: String
    let images: [String]
    let brand: String
    let detailDescription: String
    let features: [ProductFeature]
    
    // Will be firebase collection name
    static var entityIdentifier: String {
        return "products"
    }
}

struct ProductFeature: Decodable {
    let title: String
    let value: String
}
