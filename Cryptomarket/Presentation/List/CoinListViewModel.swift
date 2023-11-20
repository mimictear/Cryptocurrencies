//
//  CoinListViewModel.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation
import Observation

enum CoinListViewState {
    case loading
    case success
    case empty
    case failure(String)
}

enum CoinListFilter : String, Identifiable, CaseIterable {
    case all
    case active
    case inactive
    
    var id: Self { self }
}

@Observable
final class CoinListViewModel {
    
    @ObservationIgnored
    private var useCase = CoinListUseCase(api: CoinpaprikaAPIServiceImpl())
    
    @ObservationIgnored
    var filter: CoinListFilter = .active {
        didSet {
            filteredCoins = coins.filter { $0.getPredicate(for: filter) }
        }
    }
    
    @ObservationIgnored
    private var coins = Coins()
    
    var filteredCoins = Coins()
    var state: CoinListViewState = .empty
    
    func fetchCoins() async {
        state = .loading
        switch await useCase.execute() {
        case .success(let coins):
            if coins.isEmpty {
                state = .empty
            } else {
                state = .success
                self.coins = coins
                filteredCoins = coins.filter { $0.getPredicate(for: filter) }
            }
        case .failure(let error):
            state = .failure(error.localizedDescription)
        }
    }
}
