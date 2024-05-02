//
//  SliderRepresentation.swift
//  GuessNumberGame
//
//  Created by Tatiana Lazarenko on 4/29/24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let action: () -> Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        
        let alpha = Double(action()) / 100
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}


#Preview {
    SliderRepresentation(currentValue: .constant(20), action: { 50 })
}
