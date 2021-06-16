//
//  ContentView.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 14/06/2021.
//

import SwiftUI


struct MemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame {
        didSet {
            
        }
    }
    
    init(emojiGame: EmojiMemoryGame) {
        self.emojiGame = emojiGame
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = .black
    }
    
    var body: some View {
        let theme = emojiGame.theme
        return NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color(theme.backgroundColor).ignoresSafeArea()
                    VStack {
                        
                        GridView(emojiGame.cards) { card in
                            CardView(
                                card: card,
                                color: theme.cardColor
                            ).onTapGesture {
                                emojiGame.pickCard(card: card)
                            }.padding(5)
                        }
                        .padding()
                    }
                    
                }
                .navigationBarTitle("\(theme.id) Emoji")
                .navigationBarItems(
                    leading: Text("\(emojiGame.score)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold)),
                    trailing: Button(
                        action: {
                            emojiGame.startNewGame()
                        }
                    ){
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                    }.foregroundColor(Color.white)
                )
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    private func scaleSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.075
    }
    
    private func resyncNavView(){
        let theme = emojiGame.theme
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: theme.cardColor]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: theme.cardColor]
        UINavigationBar.appearance().barStyle = .black
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoryGameView(emojiGame: EmojiMemoryGame())
        }
    }
}
