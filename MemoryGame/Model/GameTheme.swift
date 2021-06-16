//
//  GameTheme.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 16/06/2021.
//

import SwiftUI


struct GameTheme: Identifiable {
    var id: String
    var emojisSet: Array<String>
    var numberOfPairs: Int
    var cardColor: UIColor
    var backgroundColor: UIColor
}


enum Theme: CaseIterable {
    case Sport
    case Vehicle
    case Fruit
    case Scary
    
    var gameTheme: GameTheme {
        switch self {
        case .Sport:
            let emojis: [String] = ["⚽️", "🏀", "🏈", "🎾"]
            let pairs = 4
            return GameTheme(id: "Sport", emojisSet: emojis, numberOfPairs: pairs, cardColor: .green, backgroundColor: .link)
                
        case .Fruit:
            let emojis: [String] = ["🍒", "🍎", "🥭", "🍇", "🍓", "🍍"]
            let pairs = 6
            return GameTheme(id: "Fruit", emojisSet: emojis, numberOfPairs: pairs, cardColor: .brown, backgroundColor: .systemYellow)
        case .Vehicle:
            let emojis: [String] = ["🚓", "🚀", "🛥", "🚁"]
            let pairs = 4
            return GameTheme(id: "Vehicle", emojisSet: emojis, numberOfPairs: pairs, cardColor: .darkGray, backgroundColor: .lightGray)
            
        case .Scary:
            let emojis: [String] = ["🕷", "👻", "👽", "🎃", "👹", "🤡", "🤖"]
            let pairs = 7
            return GameTheme(id: "Scary", emojisSet: emojis, numberOfPairs: pairs, cardColor: .orange, backgroundColor: .black)
        }
        
    }
}
