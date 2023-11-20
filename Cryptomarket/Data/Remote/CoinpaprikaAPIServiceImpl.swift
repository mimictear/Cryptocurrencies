//
//  CoinpaprikaAPIServiceImpl.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 18.11.2023.
//

import Foundation

enum CoinpaprikaApiError : Error {
    case unexpectedHTTPStatusCode
    case somethingWentWrong(message: String)
}

final class CoinpaprikaAPIServiceImpl : CoinpaprikaAPIService {
    
    func getGlobalMarket() async throws -> Result<GlobalDTO, Error> {
        let url = URL(string: "\(CoinpaprikaApi.baseURL)\(CoinpaprikaApi.globalMarketURL)")!
        return try await executeRequest(url: url)
    }
    
    func getCoins() async throws -> Result<[CoinDTO], Error> {
        let url = URL(string: "\(CoinpaprikaApi.baseURL)\(CoinpaprikaApi.coinsURL)")!
        return try await executeRequest(url: url)
    }
    
    func getCoin(identifier: String) {
        //TODO
    }
}
