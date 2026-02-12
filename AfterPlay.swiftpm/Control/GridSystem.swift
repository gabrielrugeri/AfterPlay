//
//  GridSystem.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 11/02/26.
//

import Foundation
import CoreGraphics

// Estrutura para facilitar o manuseio de coordenadas inteiras do Grid
struct GridPoint: Equatable, Hashable {
    let col: Int
    let row: Int
}

extension AFDimension.Grid {
    // Converte índice de grid para posição central na tela (para o SwiftUI .position)
    static func centerPosition(for gridPoint: GridPoint, toyWidthCells: Int, toyHeightCells: Int) -> CGPoint {
        let x = (CGFloat(gridPoint.col) * cellDimension) + (CGFloat(toyWidthCells) * cellDimension / 2)
        let y = (CGFloat(gridPoint.row) * cellDimension) + (CGFloat(toyHeightCells) * cellDimension / 2)
        return CGPoint(x: x, y: y)
    }
    
    // Converte uma posição de tela (arrasto) para o ponto de grid (Top-Left) mais próximo
    static func gridPoint(from screenPosition: CGPoint, toyWidthCells: Int, toyHeightCells: Int) -> GridPoint {
        // Ajusta do centro (screenPosition) para o topo-esquerda
        let topLeftX = screenPosition.x - (CGFloat(toyWidthCells) * cellDimension / 2)
        let topLeftY = screenPosition.y - (CGFloat(toyHeightCells) * cellDimension / 2)
        
        let col = Int(round(topLeftX / cellDimension))
        let row = Int(round(topLeftY / cellDimension))
        
        return GridPoint(col: col, row: row)
    }
}
