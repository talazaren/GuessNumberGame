//
//  ButtonView.swift
//  GuessNumberGame
//
//  Created by Tatiana Lazarenko on 4/29/24.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    ButtonView(title: "Проверь меня!", action: {})
}
