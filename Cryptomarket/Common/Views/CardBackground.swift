//
//  CardBackground.swift
//  Cryptomarket
//
//  Created by ANDREY VORONTSOV on 20.11.2023.
//

import SwiftUI

struct CardBackground: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

extension View {
    func cardBackground(color: Color = Color("CardBackground")) -> some View {
        modifier(CardBackground(backgroundColor: color))
    }
}
