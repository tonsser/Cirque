//
//  FloatingPoint+Utility.swift
//  Pods
//
//  Created by Philip Engberg on 05/02/2017.
//
//

import Foundation

public extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

public extension CGFloat {
    static func +(lhs: CGFloat, rhs: (clockwise: Bool, _: CGFloat)) -> CGFloat {
        return rhs.clockwise ? lhs + rhs.1 : lhs - rhs.1
    }
}
