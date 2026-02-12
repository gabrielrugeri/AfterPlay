//
//  AFProtocols.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 11/02/26.
//

import Foundation

/// Protocolo que seus modelos de Brinquedo (Toy) devem adotar
protocol GameItem: Identifiable, Hashable {
    var id: UUID { get }
    /// Define quantas células o item ocupa (ex: 1x1, 2x2).
    /// Se seus itens forem todos 1x1, você pode hardcodar isso na implementação.
    var size: (width: Int, height: Int) { get }
}

/// Representa um item já posicionado no tabuleiro
struct PlacedItem<T: GameItem>: Identifiable {
    let id: UUID // ID único da "instância" no tabuleiro
    let item: T
    var position: GridPoint
}
