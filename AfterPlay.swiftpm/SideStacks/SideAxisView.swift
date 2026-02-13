//
//  SideAxisView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI

enum Orientation {
    case horizontal
    case vertical
}

struct SideAxisView: View {
    var orientation: Orientation
    var icons: [String]
    
    var body: some View {
        if orientation == .horizontal {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .center, spacing: AFDimension.Spacing.small) {
                    ForEach(icons, id: \.self) { icon in
                        ImageOnIconView(imageName: icon)
                    }
                }
            }
            .defaultScrollAnchor(.leading)
            .frame(width: AFDimension.SideAxis.lengthLower)
            .padding(AFDimension.Padding.small)
            .background(Color(.backgroundHighlight))
            .clipShape(Capsule())
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .center, spacing: AFDimension.Spacing.small) {
                    ForEach(Icons.Assets.allCases, id: \.self) { asset in
                        ImageOnIconView(imageName: asset.rawValue)
                    }
                }
            }
            .defaultScrollAnchor(.top)
            .frame(height: AFDimension.SideAxis.lengthSide)
            .padding(AFDimension.Padding.small)
            .background(Color(.backgroundHighlight))
            .clipShape(Capsule())
        }
    }
}

struct InventoryBarView: View {
    @Bindable var viewModel: BoardViewModel // Usa @Bindable para iOS 17+
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: AFDimension.Spacing.small) {
                ForEach(viewModel.inventory) { toy in
                    Button(action: {
                        viewModel.summonToy(toy: toy)
                    }) {
                        ImageOnIconView(imageName: toy.iconAsset)
                    }
                    .buttonStyle(ScaleButtonStyle()) // Efeito de clique
                }
            }
        }
        .defaultScrollAnchor(.leading)
        .frame(width: AFDimension.SideAxis.lengthLower)
        .padding(AFDimension.Padding.small)
        .background(Color(.backgroundHighlight))
        .clipShape(Capsule())
    }
}

// Estilo de botão simples para feedback visual ao clicar
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview(traits: .landscapeLeft) {
    SideAxisView(orientation: .horizontal, icons: Icons.Toys.allCases.map(\.rawValue))
    SideAxisView(orientation: .vertical, icons: Icons.Assets.allCases.map(\.rawValue))
}
