//
//  Resource.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 19.11.2023.
//

import Foundation

enum Resource<T, E: Error> {
    case loading
    case success(data: T)
    case failure(error: E)
}
