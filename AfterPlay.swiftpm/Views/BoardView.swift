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
            // Grid de Fundo
            GridView(columns: viewModel.columns, rows: viewModel.rows)
                .stroke(Color.white.opacity(0.05), lineWidth: 1)
                // É importante que o ZStack tenha o tamanho exato do grid para os cálculos baterem
                .frame(width: AFDimension.Grid.Main.size.width,
                       height: AFDimension.Grid.Main.size.width)
            
            // Camada de Brinquedos
            ForEach(viewModel.placedToys) { placed in
                let isDragging = viewModel.draggingToyId == placed.id
                
                Image(placed.toy.topViewAsset) // Use topViewAsset (conforme Toys.swift)
                    .resizable()
                    .scaledToFit() // Garante que a proporção da imagem se mantenha
                    .frame(
                        width: placed.toy.getWidthPx(),
                        height: placed.toy.getHeightPx()
                    )
                    // Aplica o offset do arrasto apenas se for este o brinquedo sendo movido
                    .offset(isDragging ? viewModel.dragOffset : .zero)
                    .position(placed.position)
                    // Escala sutil ao pegar (feedback visual)
                    .scaleEffect(isDragging ? 1.05 : 1.0)
                    .shadow(radius: isDragging ? 10 : 0)
                    .zIndex(isDragging ? 100 : 1) // Traz para frente ao arrastar
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                viewModel.updateDrag(id: placed.id, translation: value.translation)
                            }
                            .onEnded { value in
                                viewModel.endDrag(id: placed.id, finalTranslation: value.translation)
                            }
                    )
//                    // Se houver toque simples para rotacionar, adicione aqui um TapGesture
//                    .onTapGesture {
//                        // Implemente a rotação no ViewModel se necessário
//                        // viewModel.rotateToy(id: placed.id)
//                    }
            }
        }
        .frame(width: AFDimension.Grid.Main.size.width,
               height: AFDimension.Grid.Main.size.width)
        .contentShape(Rectangle())
    }
}
