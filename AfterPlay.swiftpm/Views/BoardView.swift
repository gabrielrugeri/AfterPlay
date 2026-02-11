//
//  BoardView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 09/02/26.
//

import SwiftUI

struct BoardView: View {
    @State var viewModel: BoardViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Grid de 18px (Sua Shape original otimizada)
            GridView(columns: viewModel.columns, rows: viewModel.rows)
                .stroke(Color.black.opacity(0.05), lineWidth: 1)
            
            // Brinquedos "Invocados" no centro
            ForEach(viewModel.placedToys) { placed in
                Image(placed.toy.topDownName)
                    .resizable()
                    .frame(
                        width: CGFloat(placed.toy.gridWidth) * viewModel.cellSize,
                        height: CGFloat(placed.toy.gridHeight) * viewModel.cellSize
                    )
                    .position(placed.position)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        .frame(width: CGFloat(viewModel.columns) * viewModel.cellSize,
               height: CGFloat(viewModel.rows) * viewModel.cellSize)
        .background(Color.brown.opacity(0.1))
        .cornerRadius(12)
    }
}
