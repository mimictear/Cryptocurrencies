//
//  GlobalMarket.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

struct GlobalMarket {
    let id = UUID()
    let marketCapUsd: Double
    let cryptocurrenciesNumber: Int
    let lastUpdated: Double
    
    static let empty = Self.init(marketCapUsd: 0, cryptocurrenciesNumber: 0, lastUpdated: 0)
}

extension GlobalMarket : Identifiable {}
extension GlobalMarket : Hashable {}
