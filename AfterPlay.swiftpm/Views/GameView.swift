//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI



struct GameView: View {
    @State var gameManager = GameManager.shared
    
    var body: some View {
        VStack(alignment: .center, spacing: AFDimension.Spacing.medium) {
            PointsView(points: 19999)
            HStack (alignment: .center, spacing: AFDimension.Spacing.medium) {
                SideAxisView(orientation: .vertical, icons: Icons.Assets.allCases.map(\.rawValue))
                Image(AFAssets.Large.toyBox)
                    .resizable()
                    .frame(width: AFDimension.ToyBox.width, height: AFDimension.ToyBox.height)
                    .overlay {
                        GeometryReader { geometry in
                            let gridSize = gameManager.getGridSize(geometry.size)
                            let gridPosition = gameManager.getGridPosition(geometry.size)
                        }
                    }
                SideAxisView(orientation: .vertical, icons: Icons.Interactions.allCases.map(\.rawValue))
            }
            SideAxisView(orientation: .horizontal, icons: Icons.Toys.allCases.map(\.rawValue))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundMain))
    }
}

#Preview(traits: .landscapeLeft) {
    GameView()
}
