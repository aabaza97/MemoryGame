//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //MARK: -Data Members
    @Published private var game: MemoryGame<String> = startGame()
    
    var cards: Array<MemoryGame<String>.Card>  {
        return self.game.cards
    }
    
    //MARK: -Functions
    static func startGame() -> MemoryGame<String> {
        let emojisList: Array<String> = ["⚽️", "🏀", "🏈", "🎾", "🏐"]
        let game = MemoryGame<String>(numberOfPairs: Int.random(in: 2..<emojisList.count)) { pairIndex in
            return emojisList[pairIndex]
        }
        return game
    }
    
    
    
    func pickCard(card: MemoryGame<String>.Card) -> Void {
        self.game.select(card)
    }
}
