//
//  GridView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 02/02/26.
//

import SwiftUI

struct GridView: Shape {
    let columns: Int
    let rows: Int
    let size: CGFloat = AFDimension.Grid.cellDimension

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let maxWidth = CGFloat(columns) * size
        let maxHeight = CGFloat(rows) * size

        for i in 0...columns {
            let x = CGFloat(i) * size
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: maxHeight))
        }

        // Desenha as linhas horizontais
        for i in 0...rows {
            let y = CGFloat(i) * size
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: maxWidth, y: y))
        }

        return path
    }
}

//
//struct GridTestView: View {
//    @State private var gridSize: CGFloat = 18.0 // Tamanho inicial
//    @State var gameManager: GameManager = .shared
//    
//    var body: some View {
//        ZStack {
//            // Desenha as linhas do grid para visualização
//            GridView(size: gridSize)
//                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
//                .frame(
//                    width: 900,
//                    height: 630
//                )
//            
////            // O ambiente central (ToyBox)
////            AFIcons.Large.image(AFIcons.Large.toyBox)
//            
//            // Controle deslizante para teste em tempo real
//            VStack {
//                Slider(value: $gridSize, in: 9...90, step: 3)
//                Text("Tamanho do Grid: \(Int(gridSize))px")
//            }
//            .padding()
//            .background(Color.background.opacity(0.8))
//            .offset(y: -200)
//        }
//        
//    }
//}
//
//#Preview(traits: .landscapeLeft) {
//    GridTestView()
//}
