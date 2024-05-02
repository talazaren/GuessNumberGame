//
//  ContentView.swift
//  GuessNumberGame
//
//  Created by Tatiana Lazarenko on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                
                SliderRepresentation(currentValue: $currentValue, action: computeScore)
                
                Text("100")
            }
            
            ButtonView(title: "Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your score"),
                    message: Text("\(computeScore())"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = Double.random(in: 0...100)
                showAlert = false
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
