//
//  BoardViewModel.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 10/02/26.
//

import SwiftUI

@Observable class BoardViewModel {
    var inventory: [Toy] = []
    var placedToys: [PlacedToy] = []
    
    // A matriz "viva" do tabuleiro. Iniciamos com a baseHM (zeros ou mapa base)
    var mainGridMatrix: [[Int]] = AFHeightMap.MainGrid.baseHM
    
    let columns: Int = AFDimension.Grid.Main.columns
    let rows: Int = AFDimension.Grid.Main.rows // Note: no seu código original estava 'row' no singular
    let cellSize: CGFloat = AFDimension.Grid.cellDimension
    let centerInGrid: CGPoint = AFDimension.Grid.Main.centerPoint

    // MARK: - Inventory Logic
    
    func selectToyFromInventory(_ toy: Toy) {
        // Tenta colocar no centro, mas busca posição válida se estiver ocupado (opcional)
        // Por enquanto, mantemos sua lógica de centro, mas convertendo para GridPoint
        let centerCol = (columns - toy.getWidthCells()) / 2
        let centerRow = (rows - toy.getHeightCells()) / 2
        let startGridPoint = GridPoint(col: centerCol, row: centerRow)
        
        let startPos = AFDimension.Grid.centerPosition(
            for: startGridPoint,
            toyWidthCells: toy.getWidthCells(),
            toyHeightCells: toy.getHeightCells()
        )
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            let newPlaced = PlacedToy(toy: toy, position: startPos)
            placedToys.append(newPlaced)
            inventory.removeAll { $0.id == toy.id }
        }
    }
    
    // MARK: - Core Logic: Validação e Depósito
        
    /// Verifica se o brinquedo pode ser colocado (Regra: Espaço livre E mesmo tipo de terreno)
    func canPlace(toy: Toy, at topLeft: GridPoint) -> Bool {
        let h = toy.heightMap.count
        let w = toy.heightMap[0].count
        
        let maxHeight = mainGridMatrix.count
        let maxWidth = mainGridMatrix[0].count
        
        // Variável para armazenar o valor do terreno encontrado na primeira célula válida
        var targetTerrainValue: Int? = nil
        
        for r in 0..<h {
            for c in 0..<w {
                // Só nos importamos onde o brinquedo tem matéria física
                if toy.heightMap[r][c] != 0 {
                    
                    // 1. Verificação de Limites
                    let gridRow = topLeft.row + r
                    let gridCol = topLeft.col + c
                    
                    if gridRow < 0 || gridRow >= maxHeight || gridCol < 0 || gridCol >= maxWidth {
                        return false
                    }
                    
                    let currentBoardValue = mainGridMatrix[gridRow][gridCol]
                    
                    // 2. Verificação de Ocupação
                    // Se > 0, já tem brinquedo lá.
                    if currentBoardValue > 0 {
                        return false
                    }
                    
                    // 3. Verificação de Uniformidade (Nova Regra)
                    if let target = targetTerrainValue {
                        // Se já definimos um terreno alvo, o atual deve ser igual
                        if currentBoardValue != target {
                            return false // Tentou colocar em terrenos mistos (ex: 0 e -1)
                        }
                    } else {
                        // Primeira célula válida encontrada: define isso como o terreno obrigatório
                        targetTerrainValue = currentBoardValue
                    }
                }
            }
        }
        
        return true
    }
    
    /// Efetiva a colocação: Soma a matriz do brinquedo à matriz do tabuleiro
    func depositToy(toy: Toy, at topLeft: GridPoint) {
        let h = toy.heightMap.count
        let w = toy.heightMap[0].count
        
        for r in 0..<h {
            for c in 0..<w {
                // Soma apenas onde o brinquedo tem massa (embora somar 0 não mude nada, o if economiza acesso)
                if toy.heightMap[r][c] != 0 {
                    mainGridMatrix[topLeft.row + r][topLeft.col + c] += toy.heightMap[r][c]
                }
            }
        }
        
        print("Brinquedo depositado! Matriz atualizada.")
    }
    
    /// Remove o brinquedo da matriz (essencial para quando você for MOVER uma peça)
    func liftToy(toy: Toy, from topLeft: GridPoint) {
        let h = toy.heightMap.count
        let w = toy.heightMap[0].count
        
        for r in 0..<h {
            for c in 0..<w {
                if toy.heightMap[r][c] != 0 {
                    mainGridMatrix[topLeft.row + r][topLeft.col + c] -= toy.heightMap[r][c]
                }
            }
        }
    }
    
    // MARK: - Drag & Drop Logic Core
    
    /// Chamado enquanto o usuário arrasta
    func updateDrag(id: UUID, translation: CGSize) {
        draggingToyId = id
        dragOffset = translation
        // Aqui você poderia calcular em tempo real se a posição é válida para mudar a cor da borda (feedback)
    }
    
    /// Chamado quando o usuário solta o brinquedo
    func endDrag(id: UUID, finalTranslation: CGSize) {
        guard let index = placedToys.firstIndex(where: { $0.id == id }) else { return }
        let placedToy = placedToys[index]
        
        // 1. Calcula onde o brinquedo cairia na tela
        let predictedPosition = CGPoint(
            x: placedToy.position.x + finalTranslation.width,
            y: placedToy.position.y + finalTranslation.height
        )
        
        // 2. Converte para coordenadas do Grid (Snap)
        let targetGridPoint = AFDimension.Grid.gridPoint(
            from: predictedPosition,
            toyWidthCells: placedToy.toy.getWidthCells(),
            toyHeightCells: placedToy.toy.getHeightCells()
        )
        
        // 3. Valida as Regras do Jogo
        if isValidPosition(toy: placedToy.toy, at: targetGridPoint, ignoring: placedToy.id) {
            // Sucesso: Atualiza para a posição "snapada"
            let snappedPosition = AFDimension.Grid.centerPosition(
                for: targetGridPoint,
                toyWidthCells: placedToy.toy.getWidthCells(),
                toyHeightCells: placedToy.toy.getHeightCells()
            )
            
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                placedToys[index].position = snappedPosition
            }
        }
        
        // Limpeza
        draggingToyId = nil
        dragOffset = .zero
    }
    
    // MARK: - Validation Engine (Collision)
    
    /// Verifica se o brinquedo cabe no grid e não colide com outros
    func isValidPosition(toy: Toy, at point: GridPoint, ignoring ignoreId: UUID) -> Bool {
        // 1. Check Bounds (Limites do Tabuleiro)
        if point.col < 0 || point.row < 0 ||
           point.col + toy.getWidthCells() > columns ||
           point.row + toy.getHeightCells() > rows {
            return false
        }
        
        // 2. Check Collision (Sobreposição de HeightMaps)
        // Itera sobre todos os outros brinquedos já posicionados
        for otherPlaced in placedToys where otherPlaced.id != ignoreId {
            if checkCollision(toyA: toy, posA: point, toyB: otherPlaced.toy, posB: gridPoint(for: otherPlaced)) {
                return false
            }
        }
        
        return true
    }
    
    // Helper para converter a posição CGPoint atual de um brinquedo para GridPoint
    private func gridPoint(for placedToy: PlacedToy) -> GridPoint {
        return AFDimension.Grid.gridPoint(
            from: placedToy.position,
            toyWidthCells: placedToy.toy.getWidthCells(),
            toyHeightCells: placedToy.toy.getHeightCells()
        )
    }
    
    /// Algoritmo de Colisão "Pixel-Perfect" usando HeightMaps
    private func checkCollision(toyA: Toy, posA: GridPoint, toyB: Toy, posB: GridPoint) -> Bool {
        // Otimização: Primeiro checa bounding box simples (Rect Overlap)
        let rectA = CGRect(x: posA.col, y: posA.row, width: toyA.getWidthCells(), height: toyA.getHeightCells())
        let rectB = CGRect(x: posB.col, y: posB.row, width: toyB.getWidthCells(), height: toyB.getHeightCells())
        
        guard rectA.intersects(rectB) else { return false }
        
        // Se os retângulos colidem, verifica célula por célula nos HeightMaps
        // Apenas onde os mapas > 0 existe matéria física
        
        // Itera sobre as células do Toy A
        let heightMapA = toyA.heightMap
        let heightMapB = toyB.heightMap
        
        for rowA in 0..<heightMapA.count {
            for colA in 0..<heightMapA[0].count {
                if heightMapA[rowA][colA] > 0 { // Se Toy A tem matéria aqui
                    // Calcula a coordenada absoluta no Grid
                    let absCol = posA.col + colA
                    let absRow = posA.row + rowA
                    
                    // Converte para coordenadas relativas do Toy B
                    let relColB = absCol - posB.col
                    let relRowB = absRow - posB.row
                    
                    // Verifica se cai dentro do Toy B e se Toy B também tem matéria
                    if relColB >= 0 && relColB < toyB.getWidthCells() &&
                       relRowB >= 0 && relRowB < toyB.getHeightCells() {
                        if heightMapB[relRowB][relColB] > 0 {
                            return true // Colisão Detectada!
                        }
                    }
                }
            }
        }
        
        return false
    }
}
