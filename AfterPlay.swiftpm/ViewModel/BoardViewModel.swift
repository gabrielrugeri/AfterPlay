//
//  BoardViewModel.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 10/02/26.
//
import SwiftUI

@Observable class BoardViewModel {
    @Published var inventory: [Toy] = []
    @Published var placedToys: [PlacedToy] = []
    
    let columns: Int = AFDimension.Grid.Main.columns
    let row: Int = AFDimension.Grid.Main.rows
    let cellSize: CGFloat = AFDimension.Grid.cellDimension
    let centerInGrid: CGPoint = AFDimension.Grid.Main.centerPoint

    func selectToyFromInventory(_ toy: Toy) {
        
        // 2. Transição com animação fluida (Spring é o padrão Apple para naturalidade)
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            let newPlaced = PlacedToy(toy: toy, position: centerInGrid)
            placedToys.append(newPlaced)
            
            // 3. Auto-remoção da lista
            inventory.removeAll { $0.id == toy.id }
        }
    }
}
