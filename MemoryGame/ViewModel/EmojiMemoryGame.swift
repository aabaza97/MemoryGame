//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //MARK: -Data Members
    @Published private var game: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card>  {
        return self.game.cards.shuffled()
    }
    
    var theme: GameTheme

    var score: Int {
        return game.score
    }
    
    
    //MARK: -Inits
    init() {
        guard let theme = Theme.allCases.randomElement() else { fatalError("Init without theme...") }
        self.theme = theme.gameTheme
        self.game = EmojiMemoryGame.createGame(with: theme)
    }
    
    
    //MARK: -Behaviour Functions
    func pickCard(card: MemoryGame<String>.Card) -> Void {
        self.game.select(card)
    }
    
    func startNewGame() {
        guard let theme = Theme.allCases.randomElement() else { fatalError("Init without theme...") }
        self.theme = theme.gameTheme
        self.game = EmojiMemoryGame.createGame(with: theme)
    }
    
    //MARK: -Type Functions
    static func createGame() -> MemoryGame<String> {
        let emojisList: Array<String> = ["⚽️", "🏀", "🏈", "🎾", "🏐"]
        let randomPairs = Int.random(in: 2..<emojisList.count)
        
        let game = MemoryGame<String>(numberOfPairs: randomPairs) { pairIndex in
            return emojisList[pairIndex]
        }
        return game
    }
    
    static func createGame(with theme: Theme) -> MemoryGame<String> {
        let gameTheme = theme.gameTheme
        let emojisList = gameTheme.emojisSet.shuffled()
        return MemoryGame<String>(numberOfPairs: gameTheme.numberOfPairs) { pairIndex in
            return emojisList[pairIndex]
        }
    }
    
    
    
    
    //MARK: -Types
  
    
}
