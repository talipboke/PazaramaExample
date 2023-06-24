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
    
    // Will be firebase collection name
    static var entityIdentifier: String {
        return "products"
    }
}
