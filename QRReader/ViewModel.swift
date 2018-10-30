//
//  ViewModel.swift
//  QRReader
//
//  Created by Teja Ketepalle on 29/10/18.
//  Copyright © 2018 Teja Ketepalle. All rights reserved.
//

import Foundation

struct ProductDetail: Codable {
    let qrc1: Qrc1
    
    enum CodingKeys: String, CodingKey {
        case qrc1 = "QRC1 "
    }
}

struct Qrc1: Codable {
    let domain, id, description: String
    let validation: Validation
}

struct Validation: Codable {
    let location: Location
}

struct Location: Codable {
    let area, storeDescription: String
}

class ViewModel {
    func getProductDetails(productJSON: String, callback: (ProductDetail)->())  {
        let productData = productJSON.data(using: .utf8)
        guard let data = productData else { return }
        do {
            let decoder = JSONDecoder()
            let productDetail = try? decoder.decode(ProductDetail.self, from: data)
            callback(productDetail!)
        }
    }
    
}
