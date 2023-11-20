//
//  GlobalDTO.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

struct GlobalDTO : Decodable {
    let marketCapUsd: Double
    let cryptocurrenciesNumber: Int
    let lastUpdated: Double
}

extension GlobalDTO {
    
    var asGlobalMarket: GlobalMarket {
        .init(
            marketCapUsd: self.marketCapUsd,
            cryptocurrenciesNumber: self.cryptocurrenciesNumber,
            lastUpdated: self.lastUpdated
        )
    }
}
