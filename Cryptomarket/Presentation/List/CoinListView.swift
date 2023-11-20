//
//  CoinListView.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 18.11.2023.
//

import SwiftUI

struct CoinListView: View {
    
    @State private var viewModel = CoinListViewModel()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        List {
            ForEach(viewModel.filteredCoins) { coin in
                CoinListItemView(coin: coin)
            }
        }
        .listStyle(.plain)
        .overlay {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            case .empty:
                ContentUnavailableView("No Content", systemImage: "xmark.octagon")
            case .failure(let message):
                ContentUnavailableView("Error", systemImage: "exclamationmark.triangle", description: Text(message))
            case .success:
                let _ = print("OK")
            }
        }
        .sheet(isPresented: $showingFilterSheet) {
            CoinListFilterSheet(filter: $viewModel.filter)
        }
        .navigationTitle("Cryptomarket")
        .toolbar {
            ToolbarItem {
                Button { showingFilterSheet.toggle() } label: {
                    Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                }
            }
        }
        .refreshable { await viewModel.fetchCoins() }
        .task {
            if case .empty = viewModel.state {
                await viewModel.fetchCoins()
            }
        }
    }
}

#Preview {
    CoinListView()
}
