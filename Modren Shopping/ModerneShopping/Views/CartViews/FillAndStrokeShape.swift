//
//  FillAndStrokeShape.swift
//  ModerneShopping
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//
import SwiftUI

struct FillAndStrokeShape: View {
    var body: some View {
        strokeAndFilledCircle(strokeColor: Color.blue, lineWidth: 10, fillColor: Color.red)
    }

    func strokeAndFilledCircle(strokeColor: Color,lineWidth: CGFloat, fillColor: Color)-> some View{
        let circle = Circle()
        
        return
            ZStack{
                circle.fill(fillColor)
                circle.stroke(lineWidth: lineWidth)
                       .fill(strokeColor)
        }
    }
}
