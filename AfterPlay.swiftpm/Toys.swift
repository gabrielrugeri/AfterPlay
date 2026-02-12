//
//  Toys.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 03/02/26.
//

import Foundation

enum ToyEnum: CaseIterable {
    case basketballFree
    case basketballOnCone
    case bear
    case book
    case carInShelf
    case car1
    case car2
    case car3
    case duck
    case horseMessed
    case horseRolled
    case legoInBox
    case legoMessed
    case legoTower
    case rubix
    case russianAll
    case russian1
    case russian2
    case russian3
    case wandFree
    case wandInTube
}

class PlacedToy: Identifiable {
    let id = UUID()
    let toy: Toy
    var position: CGPoint
    
    init(toy: Toy, position: CGPoint) {
        self.toy = toy
        self.position = position
    }
}


class Toy: Identifiable {
    let id: UUID = UUID()
    var heightMap: [[Int]]
    var iconAsset: String
    var topViewAsset: String
    var rotation: Int = 0
    var isPlaced: Bool
    var possibleInteractions: [InteractionEnum]
    var side: Int
    var placementPoints: Int
    var receivedPoints: Bool
    var inPlaceInteractions: [InteractionEnum]
    
    init(heightMap: [[Int]], iconAsset: String, topViewAsset: String, points: Int) {
        self.heightMap = heightMap
        self.iconAsset = iconAsset
        self.topViewAsset = topViewAsset
        self.rotation = 0
        self.isPlaced = false
        self.possibleInteractions = [.place, .rotate]
        self.side = 0
        self.placementPoints = points
        self.receivedPoints = false
        self.inPlaceInteractions = [.move, .takeBack]
    }
    
    func dimensions() -> (Int, Int) {
        return (getWidthCells(), getHeightCells())
    }
    
    func getWidthPx() -> CGFloat {
        return CGFloat(getWidthCells()) * AFDimension.Grid.cellDimension
    }
    
    func getHeightPx() -> CGFloat {
        return CGFloat(getHeightCells()) * AFDimension.Grid.cellDimension
    }
    
    func getWidthCells() -> Int {
        return self.heightMap[0].count
    }
    
    func getHeightCells() -> Int {
        return self.heightMap.count
    }
    
    func rotate() {
        self.heightMap = self.rotateMatrix(self.heightMap)
        self.rotation = self.rotationCounter(counter: self.rotation)
    }
    
    func rotationCounter(counter: Int) -> Int {
        return (counter + 1) % 4
    }
    
    func rotateMatrix<T>(_ matrix: [[T]]) -> [[T]] {
        guard let firstRow = matrix.first else { return [] }
        
        let m = matrix.count
        let n = firstRow.count
        
        var rotated = Array(
            repeating: Array<T>(),
            count: n
        )
        
        for col in 0..<n {
            for row in stride(from: m - 1, through: 0, by: -1) {
                rotated[col].append(matrix[row][col])
            }
        }
        
        return rotated
    }
}

class Basketball: Toy {
    init() {
        super.init(heightMap: AFHeightMap.Basketball.freeHM,
                   iconAsset: AFAssets.Toys.Basketball.Solo.icon,
                   topViewAsset: AFAssets.Toys.Basketball.Solo.topView,
                   points: AFAssets.Toys.Basketball.Solo.points
        )
        self.possibleInteractions.removeAll(where: { $0 == .rotate })
    }
}

class Bear: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Bear.bearHM,
            iconAsset: AFAssets.Toys.Bear.icon,
            topViewAsset: AFAssets.Toys.Bear.topView,
            points: AFAssets.Toys.Bear.points
        )
    }
}

class Book: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Book.flatHM,
            iconAsset: AFAssets.Toys.Book.icon,
            topViewAsset: AFAssets.Toys.Book.TopView.flat,
            points: AFAssets.Toys.Book.points
        )
        self.possibleInteractions.append(.changeSide)
    }
}

class Car: Toy {
    init(version: Int) {
        var iconAsset: String
        var topViewAsset: String
        switch version {
        case 1:
            iconAsset = AFAssets.Toys.Car.Solo.C1.icon
            topViewAsset = AFAssets.Toys.Car.Solo.C1.topView
        case 2:
            iconAsset = AFAssets.Toys.Car.Solo.C2.icon
            topViewAsset = AFAssets.Toys.Car.Solo.C2.topView
        default:
            iconAsset = AFAssets.Toys.Car.Solo.C3.icon
            topViewAsset = AFAssets.Toys.Car.Solo.C3.topView
        }
        super.init(
            heightMap: AFHeightMap.Car.carHM,
            iconAsset: iconAsset,
            topViewAsset: topViewAsset,
            points: AFAssets.Toys.Car.Solo.points
        )
    }
}

class CarInShelf: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Car.shelfHM,
            iconAsset: AFAssets.Toys.Car.Shelf.icon,
            topViewAsset: AFAssets.Toys.Car.Shelf.topView,
            points: AFAssets.Toys.Car.Shelf.points
        )
    }
}

class Duck: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Duck.duckHM,
            iconAsset: AFAssets.Toys.Duck.icon,
            topViewAsset: AFAssets.Toys.Duck.topView,
            points: AFAssets.Toys.Duck.points
        )
    }
}

class Horse: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Horse.messedHM,
            iconAsset: AFAssets.Toys.Horse.MessedUp.icon,
            topViewAsset: AFAssets.Toys.Horse.MessedUp.topView,
            points: AFAssets.Toys.Horse.MessedUp.points
        )
    }
}

class Lego: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Lego.Tower.standingHM,
            iconAsset: AFAssets.Toys.Lego.Tower.icon,
            topViewAsset: AFAssets.Toys.Lego.Tower.TopView.standing,
            points: AFAssets.Toys.Lego.Tower.points
        )
    }
}

class Rubix: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Rubix.rubixHM,
            iconAsset: AFAssets.Toys.Rubix.icon,
            topViewAsset: AFAssets.Toys.Rubix.topView,
            points: AFAssets.Toys.Rubix.points
        )
    }
}

class Russian: Toy {
    init(version: Int) {
        var heightMap: [[Int]]
        var iconAsset: String
        var topViewAsset: String
        switch version {
        case 1:
            heightMap = AFHeightMap.Russian.doll1HM
            iconAsset = AFAssets.Toys.Russian.Solo.R1.icon
            topViewAsset = AFAssets.Toys.Russian.Solo.R1.topView
        case 2:
            heightMap = AFHeightMap.Russian.doll2HM
            iconAsset = AFAssets.Toys.Russian.Solo.R2.icon
            topViewAsset = AFAssets.Toys.Russian.Solo.R2.topView
        default:
            heightMap = AFHeightMap.Russian.doll3HM
            iconAsset = AFAssets.Toys.Russian.Solo.R3.icon
            topViewAsset = AFAssets.Toys.Russian.Solo.R3.topView
        }
        super.init(
            heightMap: heightMap,
            iconAsset: iconAsset,
            topViewAsset: topViewAsset,
            points: AFAssets.Toys.Russian.Solo.points
        )
    }
}

class RussianAll: Toy {
    init() {
        super.init(
            heightMap: AFHeightMap.Russian.doll1HM,
            iconAsset: AFAssets.Toys.Russian.All.icon,
            topViewAsset: AFAssets.Toys.Russian.Solo.R1.topView,
            points: AFAssets.Toys.Russian.All.points
        )
    }
}

class Wand: Toy {
    init() {
         super.init(
            heightMap: AFHeightMap.Wand.soloHM,
            iconAsset: AFAssets.Toys.Wand.Solo.icon,
            topViewAsset: AFAssets.Toys.Wand.Solo.topView,
            points: AFAssets.Toys.Wand.Solo.points
         )
     }
}


