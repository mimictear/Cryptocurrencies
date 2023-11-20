//
//  CoinListItemView.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import SwiftUI

struct CoinListItemView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            HStack {
                Text(coin.name)
                Text("(\(coin.symbol))")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(coin.isActive ? "Active" : "Inactive")
                .foregroundStyle(coin.isActive ? .green : .red)
        }
    }
}

#Preview {
    CoinListItemView(
        coin: .init(
            id: "btc-bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            rank: 1,
            isNew: true,
            isActive: true,
            type: ""
        )
    )
}
