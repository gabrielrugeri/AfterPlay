import SwiftUI
//
//// Estrutura auxiliar para coordenadas inteiras
//struct GridPoint: Equatable {
//    let col: Int
//    let row: Int
//}

@Observable class BoardViewModel {
    // MARK: - Propriedades
    var inventory: [Toy] = []
    var placedToys: [PlacedToy] = []
    
    // Matriz "viva" do tabuleiro.
    // DICA: Inicialize com AFHeightMap.MainGrid.baseHM
    // Se quiser testar a regra de terreno, mude manualmente alguns 0 para -1 nesta matriz base.
    var mainGridMatrix: [[Int]] = AFHeightMap.MainGrid.baseHM
    
    // Estados de Interação
    var draggingToyId: UUID?
    var dragOffset: CGSize = .zero
    
    // Constantes (Atalhos)
    let columns = AFDimension.Grid.Main.columns
    let rows = AFDimension.Grid.Main.rows
    let cellSize = AFDimension.Grid.cellDimension
    
    // Variável para controlar o feedback visual (Verde/Vermelho)
    var isPlacementValid: Bool = true
    
    let score = 0
    
    // MARK: - Inicialização
    init() {
        loadInitialInventory()
    }
    
    func loadInitialInventory() {
        // Adicione aqui as instâncias dos brinquedos que você quer no nível
        inventory = [
            Basketball(),
            Bear(),
            Book(),
            Car(version: 1),
            Car(version: 2),
            Car(version: 3),
            Duck(),
            Horse(),
            Lego(), // Tower
            Rubix(),
            Russian(version: 1),
            Russian(version: 2),
            Russian(version: 3),
            Wand()
        ]
    }
    
    // MARK: - Gestão de Inventário
    
    func selectToyFromInventory(_ toy: Toy) {
        // Tenta colocar no centro
        let centerCol = (columns - toy.getWidthCells()) / 2
        let centerRow = (rows - toy.getHeightCells()) / 2
        let startGridPoint = GridPoint(col: centerCol, row: centerRow)
        
        // Verifica se o centro é válido. Se não for, teríamos que buscar outro lugar,
        // mas por enquanto vamos forçar a tentativa ou rejeitar.
        if canPlace(toy: toy, at: startGridPoint) {
            depositToy(toy: toy, at: startGridPoint)
            
            let startPos = getScreenPosition(for: startGridPoint, toy: toy)
            let newPlaced = PlacedToy(toy: toy, position: startPos)
            
            withAnimation(.spring) {
                placedToys.append(newPlaced)
                inventory.removeAll { $0.id == toy.id }
            }
        } else {
            print("Não foi possível colocar o brinquedo no centro (Ocupado ou Terreno inválido).")
            // Opcional: Feedback visual de erro
        }
    }
    
    // MARK: - Summon Logic (Invocação)
        
    /// Chamado quando o usuário clica num botão do inventário
    func summonToy(toy: Toy) {
        // 1. Calcular o ponto central do Grid (em coordenadas de Grid)
        let centerCol = (columns - toy.getWidthCells()) / 2
        let centerRow = (rows - toy.getHeightCells()) / 2
        let centerGridPoint = GridPoint(col: centerCol, row: centerRow)
        
        // 2. Verificar se o centro está livre
        // Se estiver ocupado, poderíamos procurar o lugar livre mais próximo,
        // mas por enquanto vamos apenas validar.
        if canPlace(toy: toy, at: centerGridPoint) {
            
            // 3. Criar o PlacedToy
            let screenPos = getScreenPosition(for: centerGridPoint, toy: toy)
            let newPlacedToy = PlacedToy(toy: toy, position: screenPos)
            
            // 4. Atualizar o estado (com animação)
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                // Adiciona ao tabuleiro
                placedToys.append(newPlacedToy)
                // Remove do inventário
                inventory.removeAll { $0.id == toy.id }
                
                // Opcional: Já deposita na matriz lógica para ocupar o espaço
                depositToy(toy: toy, at: centerGridPoint)
            }
        }
    }
    
    // MARK: - Drag Logic Atualizada

    /// Inicia o arrasto: Remove o peso do brinquedo da matriz para evitar auto-colisão
    func startDrag(id: UUID) {
        guard let index = placedToys.firstIndex(where: { $0.id == id }) else { return }
        let placed = placedToys[index]
        
        draggingToyId = id
        
        // Converte a posição visual atual para GridPoint
        let currentGridPoint = getGridPoint(from: placed.position, toy: placed.toy)
        
        // Remove da matriz lógica temporariamente enquanto arrasta
        liftToy(toy: placed.toy, from: currentGridPoint)
        
        // Define validade inicial como true (pois ele estava num lugar válido)
        isPlacementValid = true
    }
    
    /// Atualiza durante o arrasto: Verifica validade em tempo real
    func onDragChanged(id: UUID, translation: CGSize) {
        guard let index = placedToys.firstIndex(where: { $0.id == id }) else { return }
        let placed = placedToys[index]
        
        dragOffset = translation
        
        // 1. Predizer a posição futura no Grid
        let predictedPos = CGPoint(x: placed.position.x + translation.width,
                                   y: placed.position.y + translation.height)
        let targetGridPoint = getGridPoint(from: predictedPos, toy: placed.toy)
        
        // 2. Verificar se essa posição é válida (Sem alterar a matriz ainda)
        // Como já removemos o brinquedo da matriz em startDrag, canPlace funciona perfeitamente
        withAnimation(.linear(duration: 0.1)) {
            isPlacementValid = canPlace(toy: placed.toy, at: targetGridPoint)
        }
    }
    
    /// Finaliza o arrasto: Consolida a posição
    func onDragEnded(id: UUID, translation: CGSize) {
        guard let index = placedToys.firstIndex(where: { $0.id == id }) else { return }
        let placed = placedToys[index]
        
        let predictedPos = CGPoint(x: placed.position.x + translation.width,
                                   y: placed.position.y + translation.height)
        let targetGridPoint = getGridPoint(from: predictedPos, toy: placed.toy)
        
        // A matriz já está "limpa" do brinquedo atual (foi feito no startDrag).
        // Agora decidimos onde ele pousa.
        
        if canPlace(toy: placed.toy, at: targetGridPoint) {
            // SUCESSO: Deposita no novo local
            depositToy(toy: placed.toy, at: targetGridPoint)
            
            // Snap visual
            let snappedPos = getScreenPosition(for: targetGridPoint, toy: placed.toy)
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                placedToys[index].position = snappedPos
            }
        } else {
            // FALHA: Precisa voltar para onde estava antes do arrasto começar?
            // O problema é que precisamos saber onde ele estava.
            // Para simplificar, calculamos o ponto original subtraindo a translação final
            // (Ou você pode salvar `originalPosition` no startDrag se preferir precisão absoluta)
            
            let originalGridPoint = getGridPoint(from: placed.position, toy: placed.toy)
            depositToy(toy: placed.toy, at: originalGridPoint)
            
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                // O SwiftUI reverte visualmente ao limparmos o dragOffset
            }
        }
        
        // Limpeza
        draggingToyId = nil
        dragOffset = .zero
        isPlacementValid = true // Reseta para a próxima interação
    }
    
    // MARK: - Core Logic: Validação e Matriz
    
    /// Verifica: 1. Limites | 2. Ocupação (>0) | 3. Uniformidade do Terreno
    private func canPlace(toy: Toy, at topLeft: GridPoint) -> Bool {
        let h = toy.getHeightCells()
        let w = toy.getWidthCells()
        var targetTerrain: Int? = nil // O valor do terreno que devemos respeitar
        
        for r in 0..<h {
            for c in 0..<w {
                if toy.heightMap[r][c] != 0 { // Se é parte física do brinquedo
                    let gridRow = topLeft.row + r
                    let gridCol = topLeft.col + c
                    
                    // 1. Limites
                    if gridRow < 0 || gridRow >= rows || gridCol < 0 || gridCol >= columns { return false }
                    
                    let boardVal = mainGridMatrix[gridRow][gridCol]
                    
                    // 2. Ocupação (Se > 0, já tem algo)
                    if boardVal > 0 { return false }
                    
                    // 3. Uniformidade (Deve ser igual ao primeiro terreno encontrado)
                    if let target = targetTerrain {
                        if boardVal != target { return false }
                    } else {
                        targetTerrain = boardVal
                    }
                }
            }
        }
        return true
    }
    
    /// Soma a matriz do brinquedo à matriz do tabuleiro
    private func depositToy(toy: Toy, at topLeft: GridPoint) {
        modifyMatrix(toy: toy, topLeft: topLeft, signal: 1)
    }
    
    /// Subtrai a matriz do brinquedo da matriz do tabuleiro
    private func liftToy(toy: Toy, from topLeft: GridPoint) {
        modifyMatrix(toy: toy, topLeft: topLeft, signal: -1)
    }
    
    private func modifyMatrix(toy: Toy, topLeft: GridPoint, signal: Int) {
        let h = toy.getHeightCells()
        let w = toy.getWidthCells()
        
        for r in 0..<h {
            for c in 0..<w {
                let val = toy.heightMap[r][c]
                if val != 0 {
                    let gridRow = topLeft.row + r
                    let gridCol = topLeft.col + c
                    // Segurança extra de limites
                    if gridRow >= 0 && gridRow < rows && gridCol >= 0 && gridCol < columns {
                        mainGridMatrix[gridRow][gridCol] += (val * signal)
                    }
                }
            }
        }
        // print("Matriz atualizada. Operação: \(signal > 0 ? "Depósito" : "Levantamento")")
    }
    
    // MARK: - Helpers de Conversão
    
    /// Posição Visual (Centro) -> Grid Index (TopLeft)
    func getGridPoint(from center: CGPoint, toy: Toy) -> GridPoint {
        let wPx = CGFloat(toy.getWidthCells()) * cellSize
        let hPx = CGFloat(toy.getHeightCells()) * cellSize
        let col = Int(round((center.x - wPx/2) / cellSize))
        let row = Int(round((center.y - hPx/2) / cellSize))
        return GridPoint(col: col, row: row)
    }
    
    /// Grid Index (TopLeft) -> Posição Visual (Centro)
    func getScreenPosition(for point: GridPoint, toy: Toy) -> CGPoint {
        let x = (CGFloat(point.col) * cellSize) + (CGFloat(toy.getWidthCells()) * cellSize / 2)
        let y = (CGFloat(point.row) * cellSize) + (CGFloat(toy.getHeightCells()) * cellSize / 2)
        return CGPoint(x: x, y: y)
    }
}
