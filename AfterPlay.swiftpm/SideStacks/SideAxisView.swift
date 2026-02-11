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
                        IconView(imageName: icon)
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
                        IconView(imageName: asset.rawValue)
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

struct InventoryBar: View {
    @State var viewModel: BoardViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: AFDimension.Spacing.small) {
                ForEach(viewModel.inventory) { toy in
                    Button(action: { viewModel.selectToyFromInventory(toy) }) {
                        ImageOnIconView(imageName: toy.imageName)
                    }
//                    .buttonStyle(IconButtonStyle())
                    .transition(.scale.combined(with: .opacity)) // Efeito ao sumir
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

#Preview(traits: .landscapeLeft) {
    SideAxisView(orientation: .horizontal, icons: Icons.Toys.allCases.map(\.rawValue))
    SideAxisView(orientation: .vertical, icons: Icons.Assets.allCases.map(\.rawValue))
}
