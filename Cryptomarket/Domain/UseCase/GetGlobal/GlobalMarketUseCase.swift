//
//  GlobalMarketUseCase.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

final class GlobalMarketUseCase {
    
    private let api: CoinpaprikaAPIService

    init(api: CoinpaprikaAPIService) {
        self.api = api
    }
    
    func execute() async -> Result<GlobalMarket, CoinpaprikaApiError> {
        do {
            switch try await api.getGlobalMarket() {
            case .success(let dto):
                return .success(dto.asGlobalMarket)
            case .failure(let error):
                return .failure(CoinpaprikaApiError.somethingWentWrong(message: error.localizedDescription))
            }
        } catch {
            return .failure(CoinpaprikaApiError.somethingWentWrong(message: error.localizedDescription))
        }
    }
}
