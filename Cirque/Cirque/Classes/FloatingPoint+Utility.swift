//
//  FloatingPoint+Utility.swift
//  Pods
//
//  Created by Philip Engberg on 05/02/2017.
//
//

import Foundation

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
