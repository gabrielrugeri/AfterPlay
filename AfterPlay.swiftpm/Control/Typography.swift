//
//  Typography.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 29/01/26.
//

import SwiftUI
import CoreText
import Foundation

func registerFont(named fontName: String) {
    guard let
            url = Bundle.main.url(forResource: fontName, withExtension: nil),
          CTFontManagerRegisterFontsForURL(url as CFURL, CTFontManagerScope.process, nil)
    else {
        print(":x: Failed to load font:", fontName)
        return
    }
}

struct GameTextStyle: ViewModifier {
    var customFont: String
    var size: CGFloat
    var tracking: CGFloat
    var lineSpacing: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(customFont, size: size))
            .tracking(tracking) // Ajusta o espacejamento entre letras
            .lineSpacing(lineSpacing)     // Ajusta o espaço entre linhas
//            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)  Opcional: estilo artístico
    }
}

// Extensão para facilitar a chamada
extension View {
    func fredokaTitle(
        size: CGFloat = AFTypography.FredokaTitle.size,
        tracking: CGFloat = AFTypography.FredokaTitle.tracking,
        lineSpacing: CGFloat = AFTypography.FredokaTitle.lineSpacing
    ) -> some View {
        self.modifier(GameTextStyle(customFont: AFTypography.FredokaTitle.fontName, size: size, tracking: tracking, lineSpacing: lineSpacing))
    }
}




