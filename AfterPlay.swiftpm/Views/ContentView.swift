import SwiftUI

struct ContentView: View {
    @State private var scene = SceneSequence.homeView
//    let onTap: () -> Void
    
    var body: some View {
        switch scene {
        case .homeView:
            HomeView() {
                scene = .preGame1View
            }
        case .preGame1View:
            PreGame1View() {
                scene = .preGame2View
            }
        case .preGame2View:
            PreGame2View() {
                scene = .preGame3View
            }
        case .preGame3View:
            PreGame3View() {
                scene = .preGame4View
            }
        case .preGame4View:
            PreGame4View() {
                scene = .preGame5View
            }
        case .preGame5View:
            PreGame5View() {
                scene = .preGame6View
            }
        case .preGame6View:
            PreGame6View() {
                scene = .gameView
            }
        
        case .gameView:
            GameView()
        case .postGameView:
            PostGameView(points: 999) {
                scene = .homeView
            }
        default: EmptyView()
        }
    }
}
