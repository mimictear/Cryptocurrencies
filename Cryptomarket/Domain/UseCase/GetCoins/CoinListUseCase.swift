//
//  CoinListUseCase.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

final class CoinListUseCase {
    
    private let api: CoinpaprikaAPIService

    init(api: CoinpaprikaAPIService) {
        self.api = api
    }
    
    func execute() async -> Result<Coins, CoinpaprikaApiError> {
        do {
            switch try await api.getCoins() {
            case .success(let dtos):
                return .success(dtos.map { $0.asCoin })
            case .failure(let error):
                return .failure(CoinpaprikaApiError.somethingWentWrong(message: error.localizedDescription))
            }
        } catch {
            return .failure(CoinpaprikaApiError.somethingWentWrong(message: error.localizedDescription))
        }
    }
}
