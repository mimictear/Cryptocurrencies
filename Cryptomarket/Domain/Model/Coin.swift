//
//  Coin.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

struct Coin {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let isNew: Bool
    let isActive: Bool
    let type: String
}

extension Coin : Identifiable {}
extension Coin : Hashable {}
extension Coin {
    func getPredicate(for filter: CoinListFilter) -> Bool {
        switch filter {
        case .all: true
        case .active: isActive
        case .inactive: !isActive
        }
    }
}
