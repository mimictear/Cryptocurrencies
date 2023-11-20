//
//  CoinDTO.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

/*
 "id": "btc-bitcoin",
 "name": "Bitcoin",
 "symbol": "BTC",
 "rank": 1,
 "is_new": false,
 "is_active": true,
 "type": "coin"
 */

struct CoinDTO : Decodable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let isNew: Bool
    let isActive: Bool
    let type: String
}

extension CoinDTO {
    
    var asCoin: Coin {
        .init(
            id: self.id,
            name: self.name,
            symbol: self.symbol,
            rank: self.rank,
            isNew: self.isNew,
            isActive: self.isActive,
            type: self.type
        )
    }
}
