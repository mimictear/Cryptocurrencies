//
//  GlobalMarketView.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import SwiftUI

struct GlobalMarketView: View {
    
    @Environment(AppNavigation.self) var appNavigation: AppNavigation
    
    @State private var viewModel = GlobalMarketViewModel()
    
    var body: some View {
        @Bindable var navigation = appNavigation
        NavigationStack(path: $navigation.path) {
            List {
                BasicDashboardCardView(
                    title: "Cryptocurrencies",
                    content: {
                        VStack(alignment: .leading) {
                            Text("Market Cap: \(viewModel.globalMarket.marketCapUsd.formatted(.currency(code: "USD")))")
                            Text("Cryptocurrencies Number: \(viewModel.globalMarket.cryptocurrenciesNumber)")
                            Text("Last Updated \(Date(timeIntervalSince1970: viewModel.globalMarket.lastUpdated).formatted())")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                )
                .listRowSeparator(.hidden)
                .onTapGesture { appNavigation.path.append(.list) }
            }
            .listStyle(.plain)
            .overlay {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .failure(let message):
                    ContentUnavailableView("Error", systemImage: "exclamationmark.triangle", description: Text(message))
                case .success:
                    let _ = print("OK")
                }
            }
            .navigationTitle("Cryptomarket")
            .navigationDestination(for: AppScreen.self) { $0.destination }
            .task { await viewModel.fetchGlobalMarket() }
        }
    }
}

#Preview {
    GlobalMarketView()
        .environment(AppNavigation())
}
