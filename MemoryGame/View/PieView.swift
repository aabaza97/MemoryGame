//
//  PieView.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 17/06/2021.
//

import SwiftUI

///Draws a pie shape from an angle to another.

struct Pie: Shape{
    /**
        - Parameters:
            – startAngle: The angle from which the shape starts drawing.
            – endAngle: The angle to which the shape ends drawing.
     */
    
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let startPoint = rect.center
        let radius = rect.minRadius / 2
        let edgePoint = CGPoint(
            x: startPoint.x + radius * cos(CGFloat(startAngle.radians)),
            y: startPoint.x + radius * sin(CGFloat(endAngle.radians))
        )
        
        
        var cursor = Path()
        cursor.move(to: startPoint)
        cursor.addLine(to: edgePoint)
        cursor.addArc(
            center: startPoint,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockWise
        )
        cursor.addLine(to: startPoint)
        return cursor
    }
}




