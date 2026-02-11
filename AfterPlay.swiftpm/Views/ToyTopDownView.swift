//
//  ToyTopDownView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 09/02/26.
//

import SwiftUI

struct ToyTopDownImageView: View {
    var toy: Toy
    var body: some View {
        Image(toy.topViewAsset)
            .rotationEffect(Angle(degrees: 90 * Double(toy.rotation)))
    }
}

struct ToyTopDownView: View {
    var toy: Toy
    
    var body: some View {
        ZStack {
            GridView(columns: toy.heightMap.first!.count, rows: toy.heightMap.count)
            ToyTopDownImageView(toy: toy)
        }
    }
}
