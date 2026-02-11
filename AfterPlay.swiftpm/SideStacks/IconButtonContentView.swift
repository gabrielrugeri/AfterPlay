//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI

enum Icons {
    
    // Representa a pasta "Assets"
    enum Assets: String, CaseIterable {
        case carShelf = "car_shelf"
        case coneTrunk = "cone_trunk"
        case legoBox = "lego_box"
        case shelf = "shelf"
        case wandTube = "wand_tube"
    }
    
    // Representa a pasta "Interactions"
    enum Interactions: String, CaseIterable {
        case basketballOntoCone = "basketball_onto_cone"
        case carIntoShelf = "car_into_shelf"
        case horseRollUp = "horse_roll_up"
        case legoIntoBox = "lego_into_box"
        case place = "place"
        case rotate = "rotate"
        case russianInto = "russian_into"
        case takeBack = "take_back"
        case wandIntoTube = "wand_into_tube"
    }
    
    // Representa a pasta "Toys"
    enum Toys: String, CaseIterable {
        case basketballOnCone = "basketball_on_cone"
        case basketballFree = "basketball_free"
        case bear = "bear"
        case book = "book"
        case carInShelf = "car_in_shelf"
        case car1 = "car1"
        case car2 = "car2"
        case car3 = "car3"
        case duck = "duck"
        case horseMessed = "horse_messed"
        case horseRolled = "horse_rolled"
        case legoInBox = "lego_in_box"
        case legoMessed = "lego_messed"
        case legoTower = "lego_tower"
        case rubix = "rubix"
        case russianAll = "russian_all"
        case russian1 = "russian1"
        case russian2 = "russian2"
        case russian3 = "russian3"
        case wandFree = "wand_free"
        case wandInTube = "wand_in_tube"
    }
}

struct ImageOnIconView: View {
    var imageName: String
    var opacity: Double = 1
    var body: some View {
        let length: CGFloat = AFDimension.SideAxis.iconSize
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: length, height: length)
            .opacity(opacity)
    }
}

struct IconButtonContentView: View {
    var toy: Toy
//    @State private var offset: CGSize = .zero
    var removal: (() -> Void)? = nil
    var body: some View {
        Button {
            
        } label: {
            ImageOnIconView(imageName: toy.iconAsset)
        }
//        ImageOnIconView(imageName: toy.iconAsset)
//            .draggable(toy.name) {
//                ToyTopDownView(toy: toy)
//                    .frame(width: toy.getWidthPx(),
//                           height: toy.getHeightPx()
//                    )
//            }
    }
}

struct IconButtonStyle: ButtonStyle {
//    let toy: Toy
    func makeBody(configuration: Self.Configuration) -> some View {
        let length: CGFloat = AFDimension.SideAxis.iconSize
        configuration.label
            // Frame
            .frame(width: length, height: length)
            .clipShape(Circle())

            // Click animation
            .scaleEffect(configuration.isPressed ? AFButton.scaleEffect : 1.0)
            .opacity(configuration.isPressed ? AFButton.opacityOnTap : 1.0)
            .animation(AFButton.easeOut, value: configuration.isPressed)
    }
}

//#Preview {
//    IconView(imageName: "rubix")
//}
