//
//  SwiftUIView.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 30/01/26.
//

import SwiftUI

struct PreGameCoreView: View {
    var title: String
    var text: String
    var buttonText: String = "Next"
    var background: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Image(background)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Text(title)
                    .fredokaTitle()
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .frame(width: AFDimension.CenterFrame.width, height: AFDimension.CenterFrame.height)
            
            GameButton(title: buttonText) { action() }
        }
        .background(Color(.backgroundMain))
    }
}

struct PostGameView: View {
    var points: Int
    var action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Image(AFAssets.Large.postGame)
                Spacer()
                VStack(alignment: .leading){
                    Text(AFTextContent.PostGame.text)
                        .font(.largeTitle.bold())
                        .frame(width: AFDimension.CenterFrame.pg1Title.width)
                    HStack {
                        Text(AFTextContent.PostGame.finalScore)
                            .fredokaTitle()
                            .foregroundStyle(Color(.white))
                        Text("\(points) XP")
                            .fredokaTitle()
                            .foregroundStyle(Color(.secondary))
                    }
                    .padding(AFDimension.Padding.small)
                    .background(Color(.backgroundHighlight))
                    .clipShape(RoundedRectangle(cornerRadius: AFDimension.CornerRadius.highlight))
                }
                .frame(height: AFDimension.CenterFrame.pg1Title.height)
            }
            .frame(width: AFDimension.CenterFrame.width, height: AFDimension.CenterFrame.height)
            .offset(AFDimension.Offset.pg1)
            GameButton() { action() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundMain))
    }
}

struct PreGame1View: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Image(AFAssets.Large.preGame1)
                Spacer()
                Text(AFTextContent.PreGame.PG1.text)
                    .font(.largeTitle.bold())
                    .frame(width: AFDimension.CenterFrame.pg1Title.width)
                    
            }
            .frame(width: AFDimension.CenterFrame.width, height: AFDimension.CenterFrame.height)
            .offset(AFDimension.Offset.pg1)
            GameButton() { action() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundMain))
    }
}

struct PreGame2View: View {
    var action: () -> Void
    
    var body: some View {
        PreGameCoreView(
            title: AFTextContent.PreGame.PG2.title,
            text: AFTextContent.PreGame.PG2.text,
            background: AFAssets.Background.PG2
        ) { action() }
    }
}

struct PreGame3View: View {
    var action: () -> Void
    
    var body: some View {
        PreGameCoreView(
            title: AFTextContent.PreGame.PG3.title,
            text: AFTextContent.PreGame.PG3.text,
            background: AFAssets.Background.PG3,
        ) { action() }
    }
}

struct PreGame4View: View {
    var action: () -> Void
    
    var body: some View {
        PreGameCoreView(
            title: AFTextContent.PreGame.PG4.title,
            text: AFTextContent.PreGame.PG4.text,
            background: AFAssets.Background.PG4,
        ) { action() }
    }
}

struct PreGame5View: View {
    var action: () -> Void
    
    var body: some View {
        PreGameCoreView(
            title: AFTextContent.PreGame.PG5.title,
            text: AFTextContent.PreGame.PG5.text,
            background: AFAssets.Background.PG5,
        ) { action() }
    }
}

struct PreGame6View: View {
    let title = AFTextContent.PreGame.PG6.title
//    let text = AFTextContent.PreGame.PG6.text
    let background = AFAssets.Background.PG6
    let buttonText = AFTextContent.PreGame.PG6.buttonText
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Image(background)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Text(title)
                .fredokaTitle()
                .offset(AFTypography.FredokaTitle.specialOffset)
            GameButton(title: buttonText) { action() }
//            Button(buttonText) { action() }
//                .buttonStyle(GameButtonStyle())
//                .offset(AFButton.offset)
        }
        .background(Color(.backgroundMain))
    }
}

#Preview(traits: .landscapeLeft) {
    PostGameView(points: 1000) {}
}
