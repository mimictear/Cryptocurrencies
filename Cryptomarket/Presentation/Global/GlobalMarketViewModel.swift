//
//  GlobalMarketViewModel.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Observation

enum GlobalMarketViewState {
    case loading
    case success
    case failure(String)
}

@Observable
final class GlobalMarketViewModel {
    
    @ObservationIgnored
    private var useCase = GlobalMarketUseCase(api: CoinpaprikaAPIServiceImpl())
    
    var state: GlobalMarketViewState = .loading
    var globalMarket: GlobalMarket = GlobalMarket.empty
    
    func fetchGlobalMarket() async {
        state = .loading
        switch await useCase.execute() {
        case .success(let globalMarket):
            state = .success
            self.globalMarket = globalMarket
        case .failure(let error):
            state = .failure(error.localizedDescription)
        }
    }
}
