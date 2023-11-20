//
//  CoinListFilterSheet.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import SwiftUI

struct CoinListFilterSheet: View {
    
    @Binding var filter: CoinListFilter
    
    var body: some View {
        VStack {
            Picker("Choose currency state", selection: $filter) {
                ForEach(CoinListFilter.allCases) {
                    Text($0.rawValue.capitalized).tag($0)
                }
            }
            .pickerStyle(.segmented)
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    CoinListFilterSheet(filter: .constant(.active))
}
