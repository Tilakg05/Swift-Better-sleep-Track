//
//  CircleAnimation.swift
//  BetterSleep
//
//  Created by csuftitan on 6/27/22.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        return path
    }
}
