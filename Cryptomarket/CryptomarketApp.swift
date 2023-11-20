//
//  CryptomarketApp.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 18.11.2023.
//

import SwiftUI

@main
struct CryptomarketApp: App {
    
    @State private var appNavigation = AppNavigation()
    
    var body: some Scene {
        WindowGroup {
            GlobalMarketView()
                .environment(appNavigation)
        }
    }
}
