//
//  ContentView.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 14/06/2021.
//

import SwiftUI


struct MemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("Memorize!").font(
                    .system(size: 32)).bold().foregroundColor(.orange)
                
                GridView(emojiGame.cards) { card in
                    CardView(card: card).onTapGesture {
                        emojiGame.pickCard(card: card)
                    }.padding(5)
                }
                .padding()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoryGameView(emojiGame: EmojiMemoryGame())
            MemoryGameView(emojiGame: EmojiMemoryGame())
        }
    }
}
