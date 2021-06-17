//
//  CGRect+Center.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 17/06/2021.
//

import SwiftUI


extension CGRect {
    
    ///Returns the center point of the rectangle.
    var center: CGPoint  {
       return CGPoint(x: self.midX, y: self.midY)
    }
    
    ///Returns the minimum length of the rectangle.
    var minRadius: CGFloat {
        return min(self.width, self.height)
    }
    
    ///Returns the maximum length of the rectangle.
    var maxRadius: CGFloat {
        return min(self.width, self.height)
    }
    
}



