import SwiftUI

// Fredoka-VariableFont_wdth,wght

@main
struct MyApp: App {
    init() {
//        registerFont(named: "Fredoka-VariableFont_wdth,wght.ttf")
        registerFont(named: AFTypography.FredokaTitle.fileName)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
