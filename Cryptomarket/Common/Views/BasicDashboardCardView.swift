//
//  BasicDashboardCardView.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import SwiftUI

struct BasicDashboardCardView<Content : View>: View {
    
    let title: LocalizedStringKey
    let content: Content
    
    @inlinable init(title: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                content
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "chevron.right")
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .cardBackground()
    }
}

#Preview {
    BasicDashboardCardView(title: "Title", content: { Text("Subtitle") })
}
