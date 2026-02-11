//
//  Constants.swift
//  AfterPlay
//
//  Created by Gabriel Rugeri on 27/01/26.
//

import SwiftUI

extension Color {
    static let background = Color("BackgroundMain")
    static let backgroundHighlight = Color("BackgroundHighlight")
//    static let gameAccent = Color("AccentColor")
}

class AFTypography {
    class FredokaTitle {
        static let fileName: String = "Fredoka-Bold.ttf"
        static let fontName: String = "Fredoka-Bold"
        static let size: CGFloat = 40
        static let tracking: CGFloat = 0.5
        static let lineSpacing: CGFloat = 4
        static let specialOffset: CGSize = CGSize(width: 0, height: -50)
    }
}

class AFButton {
    static let width: CGFloat = 850
    static let height: CGFloat = 99
    static let scaleEffect: CGFloat = 0.95
    static let easeOut: Animation = .easeOut(duration: 0.1)
    static let opacityOnTap: Double = 0.3
    static let offset: CGSize = CGSize(width: 0, height: 200)
}

class AFDimension {
    class CenterFrame {
        static let dimension: CGSize = CGSize(width: 850, height: 467)
        static let width: CGFloat = 850
        static let height: CGFloat = 467
        static let pg1Title: CGSize = CGSize(width: 510, height: 467)
    }
    
    class Grid {
        static let cellDimension: CGFloat = 18.0
        class Main {
            static let size: CGSize = CGSize(width: 900, height: 630)
            static let columns: Int = 50
            static let rows: Int = 35
            static let centerPoint: CGPoint = CGPoint(
                x: (CGFloat(columns) / 2) * cellDimension,
                y: (CGFloat(rows) / 2) * cellDimension
            )
            
        }
    }
    
    class SideAxis {
        static let lengthLower: CGFloat = 900
        static let lengthSide: CGFloat = 560
        static let iconSize: CGFloat = 100
    }
    
    class Offset {
        static let pg1: CGSize = CGSize(width: 0, height: -40)
    }
    
    class ToyBox { // width: 1050, height: 700
        static let width: CGFloat = 1050
        static let height: CGFloat = 700
    }
    
    class CornerRadius {
        static let button: CGFloat = 32
        static let highlight: CGFloat = 16
    }
    
    class Spacing {
        static let small: CGFloat = 12
        static let medium: CGFloat = 20
    }
    
    class HomeView {
        static let titleOffset: CGSize = CGSize(width: -50, height: -50)
        static let imageScale: CGFloat = 1.4
        static let titleScale: CGFloat = 0.80
    }
    
    class Padding {
        static let small: CGFloat = 12
    }
    
    static let padding: CGFloat = 48
    
}

class AFTextContent {
    class Home {
        static let button: String = "Play"
    }
    class PreGame {
        class PG1 {
            static let text = "Every great session of play deserves a perfect finish. Now, it’s time to give your toys a rest and prep the box for your next adventure!"
        }
        
        class PG2 {
            static let title = "How to Score"
            static let text = """
                Master the Art of Packing! The smarter you organize, the higher you score:
                Pack Tight: Save space for bonus points.
                Pack Safe: Protect toys for "Care Points."
                Pack Smart: Find the best angles to fit it all.
                """
        }
        
        class PG3 {
            static let title = "The Pro-Organizer Shop"
            static let text = """
                Got a tricky toy? Spend your points on Special Organizers! They might cost a bit - but they can really boost your score!
                """
        }
        
        class PG4 {
            static let title = "Interactive Fun"
            static let text = """
                Every toy is unique. Tap, drag, and rotate to find their best spot — and keep an eye out, some objects have special actions waiting for you to discover!
                """
        }
        
        class PG5 {
            static let title = "Goal"
            static let text = """
                Pack all your toys away to complete the match.
                """
        }
        
        class PG6 {
            static let title = "Ready, Set, ..."
            static let buttonText = "Pack!"
        }
    }
    
    class PostGame {
        static let text: String = "Amazing job! Every toy is safe, sound, and perfectly in its place. The box is ready, and so are you for the next big adventure!"
        static let button: String = "Back to Toy Room"
        static let finalScore: String = "Final Score: "
        static let xp: String = " XP"
    }
}

class AFAssets {
    
    class Toys {
        class Basketball {
            class Solo {
                static let icon = "basketball_free"
                static let topView = "PH"
                static let points = 200
            }
            class OnCone {
                static let icon = "basketball_on_cone"
                static let topView = "PH"
                static let points = 200
            }
        }
        
        class Bear {
            static let icon = "bear"
            static let topView = "PH"
            static let points = 200
        }
        
        class Book {
            static let icon = "book"
            class TopView {
                static let flat = "PH"
                static let side = "PH"
                static let spine = "PH"
            }
            static let points = 200
        }
        
        class Car {
            class Solo {
                class C1 {
                    static let icon = "car1"
                    static let topView = "PH"
                }
                class C2 {
                    static let icon = "car2"
                    static let topView = "PH"
                }
                class C3 {
                    static let icon = "car3"
                    static let topView = "PH"
                }
                static let points = 200
            }
            class Shelf {
                static let icon = "car_in_shelf"
                static let topView = "PH"
                static let points = 200
            }
        }
        
        class Duck {
            static let icon = "duck"
            static let topView = "PH"
            static let points = 200
        }
        
        class Horse {
            class MessedUp {
                static let icon = "horse_messed"
                static let topView = "PH"
                static let points = 200
            }
            class RolledUp {
                static let icon = "horse_rolled"
                static let topView = "PH"
                static let points = 200
            }
        }
        
        class Lego {
            class Tower {
                static let icon = "lego_tower"
                class TopView {
                    static let standing = "PH"
                    static let lyingTall = "PH"
                    static let lyingLong = "PH"
                }
                static let points = 200
            }
            class MessedUp {
                static let icon = "lego_messed"
                static let topView = "PH"
                static let points = -100
            }
            class InBox {
                static let icon = "lego_in_box"
                static let topView = "PH"
                static let points = 200
            }
        }
        
        class Rubix {
            static let icon = "rubix"
            static let topView = "PH"
            static let points = 200
        }
        
        class Russian {
            class Solo {
                class R1 {
                    static let icon = "russian1"
                    static let topView = "PH"
                }
                class R2 {
                    static let icon = "russian2"
                    static let topView = "PH"
                }
                class R3 {
                    static let icon = "russian3"
                    static let topView = "PH"
                }
                static let points = 200
            }
            class All {
                static let icon = "russian_all"
                static let topView = "PH"
                static let points = 200
            }
        }
        
        class Wand {
            class Solo {
                static let icon = "wand_free"
                static let topView = "PH"
                static let points = 200
            }
            class InTube {
                static let icon = "wand_in_tube"
                class TopView {
                    static let horizontal = "PH"
                    static let vertical   = "PH"
                }
                static let points = 200
            }
            
        }
    }
    
    class Interactions {
        static let basketballIntoCone = "basketball_into_cone"
        static let carIntoShelf       = "car_into_shelf"
        static let horseRollUp        = "horse_roll_up"
        static let legoIntoBox        = "lego_into_box"
        static let place              = "place"
        static let rotate             = "rotate"
        static let russianInto        = "russian_into"
        static let takeBack           = "take_back"
        static let wandIntoTube       = "wand_into_tube"
    }
    
    class Assets {
        static let carShelf   = "car_shelf"
        static let coneTrunk  = "cone_trunk"
        static let legoBox    = "lego_box"
        static let shelf      = "shelf"
        static let wandTube   = "wand_tube"
    }
    
    class Large {
        static let appTitle = "AppTitle"
        static let postGame = "PostGame"
        static let preGame1 = "PreGame1"
        static let toyBox = "ToyBox"
    }
    
    class Background {
        static let home = "BGH"
        static let PG1 = "BGPG1"
        static let PG2 = "BGPG2"
        static let PG3 = "BGPG3"
        static let PG4 = "BGPG4"
        static let PG5 = "BGPG5"
        static let PG6 = "BGPG6"
    }
}

class AFHeightMap {
    
    class MainGrid {
        static let baseHM: [[Int]] = Array(
            repeating: Array(
                repeating: 0,
                count: AFDimension.Grid.Main.columns
            ),
            count: AFDimension.Grid.Main.rows
        )
    }
    class Basketball {
        static let freeHM: [[Int]] = [
            [0, 0, 0, 0, 0, 0, 5, 6, 7, 6, 5, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 6, 7, 8, 9, 8, 7, 6, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 6, 7, 8, 9,10, 9, 8, 7, 6, 0, 0, 0, 0],
            [0, 0, 0, 6, 7, 8, 9,10,11,10, 9, 8, 7, 6, 0, 0, 0],
            [0, 0, 6, 7, 8, 9,10,11,12,11,10, 9, 8, 7, 6, 0, 0],
            [0, 6, 7, 8, 9,10,11,12,13,12,11,10, 9, 8, 7, 6, 0],
            [5, 7, 8, 9,10,11,12,13,14,13,12,11,10, 9, 8, 7, 5],
            [6, 8, 9,10,11,12,13,14,15,14,13,12,11,10, 9, 8, 6],
            [7, 9,10,11,12,13,14,15,15,15,14,13,12,11,10, 9, 7],
            [6, 8, 9,10,11,12,13,14,15,14,13,12,11,10, 9, 8, 6],
            [5, 7, 8, 9,10,11,12,13,14,13,12,11,10, 9, 8, 7, 5],
            [0, 6, 7, 8, 9,10,11,12,13,12,11,10, 9, 8, 7, 6, 0],
            [0, 0, 6, 7, 8, 9,10,11,12,11,10, 9, 8, 7, 6, 0, 0],
            [0, 0, 0, 6, 7, 8, 9,10,11,10, 9, 8, 7, 6, 0, 0, 0],
            [0, 0, 0, 0, 6, 7, 8, 9,10, 9, 8, 7, 6, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 6, 7, 8, 9, 8, 7, 6, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 5, 6, 7, 6, 5, 0, 0, 0, 0, 0, 0]
        ]
        static let coneHM: [[Int]] = [
            // 0
            [0, 0, 0, 0, 0, 0, 8, 9,10, 9, 8, 0, 0, 0, 0, 0, 0],
            // 1
            [0, 0, 0, 0, 0, 9,10,11,12,11,10, 9, 0, 0, 0, 0, 0],
            // 2
            [0, 0, 0, 0, 9,10,11,12,13,12,11,10, 9, 0, 0, 0, 0],
            // 3
            [0, 0, 0, 9,10,11,12,13,14,13,12,11,10, 9, 0, 0, 0],
            // 4
            [0, 0, 9,10,11,12,13,14,15,14,13,12,11,10, 9, 0, 0],
            // 5
            [0, 9,10,11,12,13,14,15,16,15,14,13,12,11,10, 9, 0],
            // 6
            [8,10,11,12,13,14,15,16,17,16,15,14,13,12,11,10, 8],
            // 7
            [9,11,12,13,14,15,16,17,18,17,16,15,14,13,12,11, 9],
            // 8 (centro)
            [10,12,13,14,15,16,17,18,18,18,17,16,15,14,13,12,10],
            // 9
            [9,11,12,13,14,15,16,17,18,17,16,15,14,13,12,11, 9],
            // 10
            [8,10,11,12,13,14,15,16,17,16,15,14,13,12,11,10, 8],
            // 11
            [0, 9,10,11,12,13,14,15,16,15,14,13,12,11,10, 9, 0],
            // 12
            [0, 0, 9,10,11,12,13,14,15,14,13,12,11,10, 9, 0, 0],
            // 13
            [0, 0, 0, 9,10,11,12,13,14,13,12,11,10, 9, 0, 0, 0],
            // 14
            [0, 0, 0, 0, 9,10,11,12,13,12,11,10, 9, 0, 0, 0, 0],
            // 15
            [0, 0, 0, 0, 0, 9,10,11,12,11,10, 9, 0, 0, 0, 0, 0],
            // 16
            [0, 0, 0, 0, 0, 0, 8, 9,10, 9, 8, 0, 0, 0, 0, 0, 0]
        ]
    }
    class Bear {
        static let bearHM: [[Int]] = [
            // 0
            [0, 0, 0, 0, 0, 6, 7, 8, 9, 8, 7, 6, 0, 0, 0, 0, 0],
            // 1
            [0, 0, 0, 0, 6, 8,10,11,12,11,10, 8, 6, 0, 0, 0, 0],
            // 2
            [0, 0, 0, 6, 8,11,13,14,15,14,13,11, 8, 6, 0, 0, 0],
            // 3
            [0, 0, 6, 8,11,14,16,17,18,17,16,14,11, 8, 6, 0, 0],
            // 4
            [0, 6, 8,11,14,16,17,18,18,18,17,16,14,11, 8, 6, 0],
            // 5
            [0, 6, 9,12,15,17,18,18,18,18,18,17,15,12, 9, 6, 0],
            // 6
            [0, 7,10,13,16,18,18,18,18,18,18,18,16,13,10, 7, 0],
            // 7
            [0, 7,10,13,16,17,18,18,18,18,18,17,16,13,10, 7, 0],
            // 8
            [0, 6, 9,12,15,16,17,18,18,18,17,16,15,12, 9, 6, 0],
            // 9
            [0, 0, 7,10,13,15,16,17,17,17,16,15,13,10, 7, 0, 0],
            // 10
            [0, 0, 0, 8,11,13,14,15,15,15,14,13,11, 8, 0, 0, 0],
            // 11
            [0, 0, 0, 0, 7, 9,11,12,12,12,11, 9, 7, 0, 0, 0, 0],
            // 12
            [0, 0, 0, 0, 0, 6, 8, 9, 9, 9, 8, 6, 0, 0, 0, 0, 0],
            // 13
            [0, 0, 0, 0, 0, 0, 6, 7, 7, 7, 6, 0, 0, 0, 0, 0, 0]
        ]
    }
    class Book {
        static let flatHM: [[Int]] = Array(
            repeating: Array(repeating: 2, count: 18),
            count: 14
        )
        static let sideHM: [[Int]] = Array(
            repeating: Array(repeating: 14, count: 18),
            count: 2
        )
        static let spineHM: [[Int]] = Array(
            repeating: Array(repeating: 18, count: 14),
            count: 2
        )
    }
    class Car {
        static let carHM: [[Int]] = [
            // 0
            [0, 1, 2, 2, 2, 2, 1, 0],
            // 1
            [1, 2, 2, 2, 2, 2, 2, 1],
            // 2
            [1, 2, 2, 2, 2, 2, 2, 1],
            // 3
            [0, 1, 2, 2, 2, 2, 1, 0]
        ]
        static let shelfHM: [[Int]] = [
            // 0
            [12,12,12,12,12,12,12,12,12,12],
            // 1
            [12,12,12,12,12,12,12,12,12,12],
            // 2
            [12,12,12,12,12,12,12,12,12,12],
            // 3
            [12,12,12,12,12,12,12,12,12,12],
            // 4
            [12,12,12,12,12,12,12,12,12,12],
            // 5
            [12,12,12,12,12,12,12,12,12,12]
        ]
    }
    class Duck {
        static let duckHM: [[Int]] = [
            [0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 2, 1, 0, 0],
            [0, 3, 5, 3, 2, 4, 5, 6, 6, 6, 5, 4, 2, 0],
            [4, 7, 8, 7, 5, 6, 7, 8, 8, 8, 7, 5, 3, 1],
            [6, 8, 9, 8, 6, 7, 8, 8, 8, 8, 8, 6, 4, 2],
            [6, 8, 9, 8, 6, 7, 8, 8, 8, 8, 8, 6, 4, 2],
            [4, 7, 8, 7, 5, 6, 7, 8, 8, 8, 7, 5, 3, 1],
            [0, 3, 5, 3, 2, 4, 5, 6, 6, 6, 5, 4, 2, 0],
            [0, 0, 0, 0, 1, 2, 3, 3, 3, 3, 2, 1, 0, 0]
        ]
    }
    class Horse {
        static let rolledHM: [[Int]] = [
            [0, 0, 0, 0, 4, 10, 15, 18, 18, 18, 18, 15, 10, 4, 0, 0, 0, 0],
            [0, 0, 0, 4, 12, 14, 16, 17, 17, 17, 17, 16, 14, 12, 4, 0, 0, 0],
            [0, 0, 4, 10, 13, 13, 14, 14, 14, 14, 14, 14, 13, 13, 10, 4, 0, 0],
            [0, 4, 8, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 11, 8, 4, 0, 0],
            [4, 10, 12, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 10, 4, 4],
            [5, 12, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 14, 14, 14, 12, 5, 5],
            [6, 12, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 12, 6, 6],
            [6, 12, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 12, 6, 6],
            [5, 12, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 14, 14, 14, 12, 5, 5],
            [4, 10, 12, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 10, 4, 4],
            [0, 4, 8, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 11, 8, 4, 0, 0],
            [0, 0, 4, 10, 12, 12, 12, 12, 12, 12, 12, 12, 12, 10, 4, 0, 0, 0],
            [0, 0, 0, 4, 8, 10, 11, 11, 11, 11, 10, 10, 8, 4, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 4, 5, 6, 6, 6, 6, 5, 4, 0, 0, 0, 0, 0]
        ]
        static let messedHM: [[Int]] = rolledHM + [
            [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
            [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
            [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
            [0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0],
            [1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1],
            [0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0],
            [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
            [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0]
        ]
    }
    class Lego {
        static let boxHM: [[Int]] = Array(
            repeating: Array(
                repeating: 14, count: 21),
            count: 14)
        static let messedHM: [[Int]] = [
            [0,0,0,1,1,1,2,2,2,2,2,2,2,2,1,1,1,0,0,0,0],
            [0,0,1,1,2,2,2,3,3,3,3,3,3,2,2,2,1,1,0,0,0],
            [0,1,1,2,2,3,3,3,3,3,3,3,3,3,3,2,2,1,1,0,0],
            [1,1,2,2,3,3,3,3,3,3,3,3,3,3,3,3,2,2,1,1,0],
            [1,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1],
            [0,1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,1,0],
            [0,0,1,2,2,3,3,3,3,3,3,3,3,3,3,2,2,1,1,0,0],
            [0,0,0,1,2,2,2,3,3,3,3,3,3,2,2,2,1,1,0,0,0],
            [0,0,0,0,1,1,2,2,2,2,2,2,2,2,1,1,1,0,0,0,0],
            [0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0]
        ]
        class Tower {
            static let standingHM: [[Int]] = [
                [16, 17, 18, 18, 17, 16],
                [17, 18, 18, 18, 18, 17],
                [18, 18, 18, 18, 18, 18],
                [18, 18, 18, 18, 18, 18],
                [17, 18, 18, 18, 18, 17],
                [16, 17, 18, 18, 17, 16]
            ]
            static let lyingLongHM: [[Int]] = [
                [4, 5, 6, 6, 5, 4],
                [4, 5, 6, 6, 5, 4],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [5, 6, 6, 6, 6, 5],
                [4, 5, 6, 6, 5, 4],
                [4, 5, 6, 6, 5, 4]
            ]
            static let lyingTallHM: [[Int]] = [
                [4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4],
                [5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5],
                [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
                [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
                [5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5],
                [4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4]
            ]
        }
    }
    class Rubix {
        static let rubixHM: [[Int]] = Array(
            repeating: Array(
                repeating: 6, count: 6),
            count: 6)
    }
    class Russian {
        static let doll1HM: [[Int]] = [
            [0, 0, 3, 5, 5, 3, 0, 0],
            [0, 4, 7, 9, 9, 7, 4, 0],
            [3, 7,11,13,13,11, 7, 3],
            [5, 9,13,15,15,13, 9, 5],
            [5, 9,13,15,15,13, 9, 5],
            [3, 7,11,13,13,11, 7, 3],
            [0, 4, 7, 9, 9, 7, 4, 0],
            [0, 0, 3, 5, 5, 3, 0, 0]
        ]
        static let doll2HM: [[Int]] = [
            [0, 2, 4, 4, 2, 0],
            [2, 5, 7, 7, 5, 2],
            [4, 7,10,10, 7, 4],
            [4, 7,10,10, 7, 4],
            [2, 5, 7, 7, 5, 2],
            [0, 2, 4, 4, 2, 0]
        ]
        static let doll3HM: [[Int]] = [
            [0, 3, 3, 0],
            [3, 6, 6, 3],
            [3, 6, 6, 3],
            [0, 3, 3, 0]
        ]
    }
    class Wand {
        static let soloHM: [[Int]] = Array(
            repeating: Array(
                repeating: 2, count: 22),
            count: 2)
        class Tube {
            static let horizontalHM: [[Int]] = Array(
                repeating: Array(
                    repeating: 3, count: 23),
                count: 3)
            static let verticalHM: [[Int]] = Array(
                repeating: Array(
                    repeating: 23, count: 3),
                count: 3)
        }
    }
    class Shelf {
        static let shelfHM: [[Int]] = Array(
            repeating: Array(
                repeating: -1, count: 20),
            count: 14)
    }
}
