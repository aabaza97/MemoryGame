//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import Foundation
import SwiftUI

struct MemoryGame<Content> where Content: Equatable{
    //MARK: -Data Members
    var cards: Array<Card> = Array()
    var score: Int = 0
    
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
                cards[selectedCardIndex].flip()
                cards[potentialMatchingIndex].flip()
                if cards[selectedCardIndex].content == cards[potentialMatchingIndex].content {
                    self.cardsMatched(firstCardIndex: selectedCardIndex, secondCardIndex: potentialMatchingIndex)
                } else if cards[selectedCardIndex].flipCount > 1 || cards[potentialMatchingIndex].flipCount > 1{
                    self.cardsMisMatched()
                }
                self.cards[selectedCardIndex].isFacing = true
            } else {
                indexOfDistinctFacingCard = selectedCardIndex
            }
        }
    }
    
    mutating func shuffleCards() -> Array<Card> {
        self.cards.shuffled()
    }
    
    mutating func cardsMatched(firstCardIndex: Int, secondCardIndex: Int) -> Void {
        self.cards[firstCardIndex].matched()
        self.cards[secondCardIndex].matched()
        self.score += 2
    }
    
    mutating func cardsMisMatched() -> Void {
        self.score -= 1
    }
    
    //MARK: -Types
    struct Card: Identifiable {
        var id: Int
        var isFacing: Bool = false
        var didMatch: Bool = false
        var content: Content
        var flipCount: Int = 0 // Number of times the card has been flipped
        
        mutating func flip() -> Void {
            self.flipCount += 1
        }
        
        mutating func matched() -> Void {
            self.didMatch = true
        }
    }

}
