//
//  CoinpaprikaAPIService.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import Foundation

protocol CoinpaprikaAPIService {
    
    func getGlobalMarket() async throws -> Result<GlobalDTO, Error>
    
    func getCoins() async throws -> Result<[CoinDTO], Error>
}

extension CoinpaprikaAPIService {
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    func executeRequest<T: Decodable>(url: URL) async throws -> Result<T, Error> {
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: URLRequest(url: url))
            guard (urlResponse as? HTTPURLResponse)?.statusCode == 200 else {
                return .failure(CoinpaprikaApiError.unexpectedHTTPStatusCode)
            }
            let response = try decoder.decode(T.self, from: data)
            return .success(response)
        } catch {
            return .failure(CoinpaprikaApiError.somethingWentWrong(message: error.localizedDescription))
        }
    }
}
