//
//  AppConst.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import Foundation

enum AppConst: String {
    case addToCard = "Sepete Ekle"
    case searchBarPlaceHolderText = "Marka, ürün veya hizmet arayın"
    case productDescription = "Ürün Açıklaması"
    case productFeatures = "Ürün Özellikleri"
    
    func text() -> String {
        return self.rawValue
    }
}
