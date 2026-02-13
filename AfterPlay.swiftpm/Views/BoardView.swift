import SwiftUI

struct BoardView: View {
    @State var viewModel: BoardViewModel // @State para iOS 17+ (se usar @Observable)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // 1. Grid Background
            GridView(columns: viewModel.columns, rows: viewModel.rows)
                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                .frame(width: CGFloat(viewModel.columns) * viewModel.cellSize,
                       height: CGFloat(viewModel.rows) * viewModel.cellSize)
            
            // 2. Placed Toys
            ForEach(viewModel.placedToys) { placed in
                let isDragging = viewModel.draggingToyId == placed.id
                
                Image(placed.toy.topViewAsset) // Confirme se o nome da var é topViewAsset no seu Toy.swift
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: CGFloat(placed.toy.getWidthCells()) * viewModel.cellSize,
                        height: CGFloat(placed.toy.getHeightCells()) * viewModel.cellSize
                    )
                    // Posição + Offset do arrasto
                    .position(placed.position)
                    .offset(isDragging ? viewModel.dragOffset : .zero)
                    // Efeitos Visuais
                    .scaleEffect(isDragging ? 1.1 : 1.0)
                    .shadow(color: .black.opacity(0.3), radius: isDragging ? 10 : 0, x: 0, y: 5)
                    .zIndex(isDragging ? 100 : 1)
                    // Gesto
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                viewModel.onDragChanged(id: placed.id, translation: value.translation)
                            }
                            .onEnded { value in
                                viewModel.onDragEnded(id: placed.id, translation: value.translation)
                            }
                    )
                    // Rotação (Toque Duplo ou Simples)
                    .onTapGesture(count: 2) {
                        // Implementaremos rotação no próximo passo
                        print("Double tap para rotacionar!")
                    }
            }
        }
        .frame(width: CGFloat(viewModel.columns) * viewModel.cellSize,
               height: CGFloat(viewModel.rows) * viewModel.cellSize)
        .background(Color.white.opacity(0.5)) // Fundo do tabuleiro
        .cornerRadius(16)
    }
}
