//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI



import SwiftUI

struct GameView: View {
    // 1. Criamos a instância do ViewModel que contém os brinquedos
    @State var viewModel = BoardViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: AFDimension.Spacing.medium) {
            
            // Topo: Pontuação
            PointsView(points: viewModel.score)
            
            // Centro: Eixos laterais + Caixa + Tabuleiro Interativo
            HStack(alignment: .center, spacing: AFDimension.Spacing.medium) {
                
                // Lateral Esquerda (Estática)
                SideAxisView(orientation: .vertical, icons: Icons.Assets.allCases.map(\.rawValue))
                
                // O CENTRO DO JOGO
                ZStack {
                    // 1. A Imagem de Fundo (A caixa visual)
                    Image(AFAssets.Large.toyBox)
                        .resizable()
                        .frame(width: AFDimension.ToyBox.width, height: AFDimension.ToyBox.height)
                    
                    // 2. O Tabuleiro Lógico (Onde os brinquedos aparecem)
                    // Ele precisa ter o tamanho exato definido no seu Grid System para o alinhamento funcionar
                    BoardView(viewModel: viewModel)
                        // Ajuste fino: talvez precise de um offset se a grade não começar no pixel 0 da imagem
                        // .offset(x: 10, y: 20)
                }
                .frame(width: AFDimension.ToyBox.width, height: AFDimension.ToyBox.height)
                
                // Lateral Direita (Interações)
                SideAxisView(orientation: .vertical, icons: Icons.Interactions.allCases.map(\.rawValue))
            }
            
            InventoryBarView(viewModel: viewModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundMain")) // Ajustei para string segura caso a extensão não esteja visível
        .ignoresSafeArea()
    }
}

#Preview(traits: .landscapeLeft) {
    GameView()
}

#Preview(traits: .landscapeLeft) {
    GameView()
}
