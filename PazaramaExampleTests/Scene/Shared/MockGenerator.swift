//
//  MockGenerator.swift
//  PazaramaExampleTests
//
//  Created by Talip on 26.06.2023.
//

import Foundation
@testable import PazaramaExample

final class MockGenerator {
    static func createProduct() -> ProductModel {
        return ProductModel.init(id: nil,
                                 name: "New Regular Fit Bisiklet Yaka Basic Kısa Kollu %100 Pamuk Tişört X1266AZ22SMOG532",
                                 price: "129,99 TL",
                                 images: [
                                    "https://cdn.pazarama.com/MNRESIZE/600/600/asset/8683522873240/45019354-0d8a-42b4-b201-08d93c66b022/newregularfitbisikletyakabasicksakollutirt-1.jpg",
                                    "https://cdn.pazarama.com/MNRESIZE/600/600/asset/8683522873240/45019354-0d8a-42b4-b201-08d93c66b022/newregularfitbisikletyakabasicksakollutirt-5.jpg"
                                 ],
                                 brand: "Defactor",
                                 detailDescription: "Konforlu kullanım sağlayan pamuklu yumuşak kumaşı, basic ve şık tasarımı ile jean ve chino pantolonlar, spor ve kumaş kesimli şortlar ile kombinleyip klasik ve spor tarzınızı tamamlayabileceğiniz, sıcak yaz günlerinde kendinize dinamik ve trend bir hava katabileceğiniz DeFacto Erkek New Regular Fit Bisiklet Yaka Basic Kısa Kollu Tişört. Pamuk 100% Manken Bedeni: Göğüs: 99 Boy: 1,88 Basen: 96 Bel: 78",
                                 features: [
                                    ProductFeature(title: "Beden/Yaş", value: "XS"),
                                    ProductFeature(title: "Renk", value: "Turuncu"),
                                    ProductFeature(title: "Cinsiyet", value: "Erkek")
                                 ])
    }
}
