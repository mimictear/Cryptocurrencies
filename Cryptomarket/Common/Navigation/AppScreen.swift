//
//  AppScreen.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import SwiftUI

enum AppScreen : Hashable {
    case list
    case details(identifier: String)
}

extension AppScreen {
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            CoinListView()
        case .details(let identifier):
            CoinDetailsView(identifier: identifier)
        }
    }
}
