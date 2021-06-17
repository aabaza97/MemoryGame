//
//  CardView.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import SwiftUI


struct CardView: View {
    //MARK: -UI CONSTS
    let cornerRadius: CGFloat = 15
    let fontScaleFactor: CGFloat = 0.75
    
    //MARK: -Properties
    var card: MemoryGame<String>.Card
    var color: UIColor
    
    //MARK: -UI Implementation
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 20))
                    .padding(3)
                    .opacity(0.4)
                Text(card.content)
            }
            .cardify(isFacing: card.isFacing, didMatch: card.didMatch)
            .foregroundColor(Color(color))
            .font(.system(size: scaleSize(for: geo.size), weight: .regular))
        }
    }
    
    func scaleSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * self.fontScaleFactor
    }
}

