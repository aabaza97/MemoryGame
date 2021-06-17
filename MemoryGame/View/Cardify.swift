//
//  Cardify.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 17/06/2021.
//

import SwiftUI


struct Cardify: ViewModifier {
    //MARK: -UI CONSTS
    let cornerRadius: CGFloat = 15
    let fontScaleFactor: CGFloat = 0.75
    
    //MARK: -Data Members
    var isFacing: Bool
    var didMatch: Bool
    
    
    //MARK: -Functions
    func body(content: Content) -> some View {
        ZStack {
            if isFacing {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                content
            } else {
                if !didMatch {
                    RoundedRectangle(cornerRadius: cornerRadius)
                }
            }
        }
    }
    
}


//MARK: - View EXT
extension View{
    func cardify(isFacing: Bool, didMatch: Bool) -> some View {
        return self.modifier(Cardify(isFacing: isFacing, didMatch: didMatch))
    }
}
