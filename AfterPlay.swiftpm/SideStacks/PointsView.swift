//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI

struct PointsView: View {
    var points: Int
    var body: some View {
        VStack(alignment: .center, spacing: AFDimension.Spacing.small) {
            Text("Points")
                .font(.title)
            Text(String(points))
                .font(.largeTitle.bold())
        }
    }
}

#Preview {
    PointsView(points: 2200)
}
