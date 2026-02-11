//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 29/01/26.
//

import SwiftUI

struct TitleOnHomeView: View {
    var body: some View {
        Image(AFAssets.Large.appTitle)
            .scaleEffect(AFDimension.HomeView.titleScale)

    }
}

struct HomeView: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Image(AFAssets.Background.home)
                .scaleEffect(AFDimension.HomeView.imageScale)
            TitleOnHomeView()
                .offset(AFDimension.HomeView.titleOffset)
            GameButton(title: AFTextContent.Home.button) {
                action()
            }
            
        }
    }
}

#Preview(traits: .landscapeLeft) {
    HomeView() {}
}
