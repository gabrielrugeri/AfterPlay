//
//  GameManager.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 03/02/26.
//

import SwiftUI

@MainActor
@Observable final class GameManager {
    static let shared = GameManager()
    
    private init() {}
    
    var score: Int = 0
    var inventory: [ToyEnum] = [
        .basketballFree,
        .bear,
        .book,
        .car1,
        .car2,
        .car3,
        .duck,
        .horseMessed,
        .legoTower,
        .rubix,
        .russian1,
        .russian2,
        .russian3,
        .wandFree
    ]
    var gridSize: CGSize = .zero
    var gridPosition: CGPoint = .zero
    
//    private func setGridSizeNPosition(_ size: CGSize) -> Void {
//        return
//    }
    
    func getGridSize(_ size: CGSize) -> CGSize {
        self.gridSize = CGSize(width: size.width*0.862, height: size.height*0.901)
        return self.gridSize
    }
    
    func getGridPosition(_ size: CGSize) -> CGPoint {
        self.gridPosition = CGPoint(x: size.width / 2 + 5, y: size.height / 2 + 1.5)
        return self.gridPosition
    }
    
    func gameSetup() -> Void {
        self.score = 0
        self.inventory.shuffle()
    }
    
    
}
