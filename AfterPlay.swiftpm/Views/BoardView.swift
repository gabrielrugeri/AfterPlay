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
            
            ForEach(viewModel.placedToys) { placed in
                let isDragging = viewModel.draggingToyId == placed.id
                
                Image(placed.toy.topViewAsset)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: CGFloat(placed.toy.getWidthCells()) * viewModel.cellSize,
                        height: CGFloat(placed.toy.getHeightCells()) * viewModel.cellSize
                    )
                    // --- LÓGICA DE SOMBRA E COR ---
                    .opacity(isDragging ? 0.9 : 1.0)
                    // Aplica o filtro de cor APENAS se estiver arrastando
                    .colorMultiply(
                        isDragging ? (viewModel.isPlacementValid ? .green : .red) : .white
                    )
                    // Adiciona uma borda colorida também para reforçar (opcional)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                isDragging ? (viewModel.isPlacementValid ? Color.green : Color.red) : Color.clear,
                                lineWidth: 2
                            )
                    )
                    // -----------------------------
                    .position(placed.position)
                    .offset(isDragging ? viewModel.dragOffset : .zero)
                    .zIndex(isDragging ? 100 : 1)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Importante: Chamar startDrag apenas no início
                                if viewModel.draggingToyId == nil {
                                    viewModel.startDrag(id: placed.id)
                                }
                                viewModel.onDragChanged(id: placed.id, translation: value.translation)
                            }
                            .onEnded { value in
                                viewModel.onDragEnded(id: placed.id, translation: value.translation)
                            }
                    )
            }
        }
        .frame(width: CGFloat(viewModel.columns) * viewModel.cellSize,
               height: CGFloat(viewModel.rows) * viewModel.cellSize)
//        .background(Color.white.opacity(0.5))  Fundo do tabuleiro
        .cornerRadius(16)
    }
}
