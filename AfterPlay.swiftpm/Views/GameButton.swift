//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 29/01/26.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                // Text
                .fredokaTitle() // Aplica sua fonte customizada
                .foregroundColor(.white)
        
                // Frame
                .frame(width: AFButton.width, height: AFButton.height)
                .background(Color(.accent))
                .clipShape(RoundedRectangle(cornerRadius: AFDimension.CornerRadius.button))

                // Click animation
                .scaleEffect(configuration.isPressed ? AFButton.scaleEffect : 1.0)
                .opacity(configuration.isPressed ? AFButton.opacityOnTap : 1.0)
                .animation(AFButton.easeOut, value: configuration.isPressed)
        }
}

struct GameButton: View {
    var title: String = "Next"
    var action: () -> Void
    
    var body: some View {
        Button(title) {
//            AFButton.onFinish()
            action()
        }
        // Aplica o estilo visual 3D que criamos
        .buttonStyle(GameButtonStyle())
        
        // Aplica o deslocamento fixo definido na sua classe de constantes
        .offset(AFButton.offset)
    }
}

#Preview(traits: .landscapeLeft) {
    GameButton(title: AFTextContent.Home.button, action: {})
}


