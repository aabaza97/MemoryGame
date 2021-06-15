//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import Foundation

struct MemoryGame<Content> where Content: Equatable{
    //MARK: -Data Members
    var cards: Array<Card> = Array()
    
    var indexOfDistinctFacingCard: Int? {
        get {
            let upFacingIndices = cards.indices.filter { index in cards[index].isFacing }
            return upFacingIndices.count == 1 ? upFacingIndices.first : nil
        }
        
        set {
            for cardIndex in cards.indices {
                cards[cardIndex].isFacing = cardIndex == newValue
            }
        }
    }
    
    
    //MARK: -Inits
    init(numberOfPairs: Int, fromFactory: (Int) -> Content) {
        for pairIndex in 0 ..< numberOfPairs {
            let cardContent = fromFactory(pairIndex)
            self.cards.append(Card(id: pairIndex*2, content: cardContent))
            self.cards.append(Card(id: pairIndex*2+1, content: cardContent))
        }
    }
    
    
    //MARK: -Functions
    mutating func select(_ card: Card) -> Void {
        print(card)
        if let selectedCardIndex = cards.firstIndex(matches: card),
           !cards[selectedCardIndex].didMatch,
           !cards[selectedCardIndex].isFacing{
            if let potentialMatchingIndex = indexOfDistinctFacingCard {
                if cards[selectedCardIndex].content == cards[potentialMatchingIndex].content {
                    cards[selectedCardIndex].didMatch.toggle()
                    cards[potentialMatchingIndex].didMatch.toggle()
                }
                self.cards[selectedCardIndex].isFacing = true
            } else {
                indexOfDistinctFacingCard = selectedCardIndex
            }
        }
    }
    
    
    //MARK: -Types
    struct Card: Identifiable {
        var id: Int
        var isFacing: Bool = false
        var didMatch: Bool = false
        var content: Content
    }
    
}
