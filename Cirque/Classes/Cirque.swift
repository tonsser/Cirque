//
//  CircularMultiColorGradientView.swift
//  Tonsser
//
//  Created by Philip Engberg on 03/02/2017.
//  Copyright © 2017 tonsser. All rights reserved.
//

import Foundation

public protocol CirqueDataType {
    var color : UIColor { get }
    var value : Float { get }
}

public class CirqueView : UIView {
    
    public var dataPoints: [CirqueDataType]? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var transitionSize: CGFloat = 0.025
    public var stepSize: CGFloat = 0.1
    public var lineWidth: CGFloat = 5
    
    fileprivate var circleRadius : CGFloat {
        return (self.bounds.size.width - lineWidth)/2
    }
    
    fileprivate var circleCenter : CGPoint {
        return CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
    }
    
    fileprivate func drawGradient(_ fromColor: UIColor, toColor: UIColor, from startPosition: CGFloat, with relativeSize: CGFloat) {
        
        let zeroAngle = CGFloat(-90.0).degreesToRadians
        let startAngle    = zeroAngle + (CGFloat(360).degreesToRadians * startPosition)
        let finalEndAngle = zeroAngle + (CGFloat(360).degreesToRadians * (startPosition + max(relativeSize, 0)))
        let fraction = abs(finalEndAngle - startAngle)
        var runningStartAngle = startAngle
        
        let startColorComponents = fromColor.components
        let finalColorComponents = toColor.components
        
        let processPath = UIBezierPath()
        processPath.lineWidth = lineWidth
        
        for step in stride(from: CGFloat(0), through: 1.0, by: stepSize) {
            
            let endAngle = (step * fraction) + startAngle
            
            let newRed   = startColorComponents.red   + (finalColorComponents.red   - startColorComponents.red)   * step
            let newGreen = startColorComponents.green + (finalColorComponents.green - startColorComponents.green) * step
            let newBlue  = startColorComponents.blue  + (finalColorComponents.blue  - startColorComponents.blue)  * step
            let progressColor = UIColor(red:newRed, green:newGreen, blue:newBlue, alpha:1.0)
            
            progressColor.set()
            
            processPath.addArc(withCenter: circleCenter, radius: circleRadius, startAngle: runningStartAngle, endAngle: endAngle, clockwise: true)
            processPath.stroke()
            processPath.removeAllPoints()
            
            runningStartAngle = endAngle - 0.01
        }
    }
    
    fileprivate func drawSolid(_ color: UIColor, from startPosition: CGFloat, with relativeSize: CGFloat) {
        let zeroAngle = CGFloat(-90.0).degreesToRadians
        let startAngle    = zeroAngle + (CGFloat(360).degreesToRadians * startPosition)
        let finalEndAngle = zeroAngle + (CGFloat(360).degreesToRadians * (startPosition + max(relativeSize, 0)))
        let processPath = UIBezierPath()
        processPath.lineWidth = lineWidth
        
        color.set()
        
        processPath.addArc(withCenter: circleCenter, radius: circleRadius, startAngle: startAngle, endAngle: finalEndAngle, clockwise: true)
        processPath.stroke()
        processPath.removeAllPoints()
    }
    
    override public func draw(_ rect: CGRect) {
        
        guard let dataPoints = self.dataPoints else { return }
        guard dataPoints.count > 0 else { return }
        
        let context = UIGraphicsGetCurrentContext()
        
        // Cleaer any previous drawings
        context?.clear(rect)
        
        var start: CGFloat = 0.0 // Start of the the stroke in radians
        var size: CGFloat = 0.0 // Size (or length) of the stroke in percent
        let overlapSize: CGFloat = 0.001 // How much to backtrack before drawing to ensure that there are no gaps between stroke elements
        
        // If there is jus one data point, just draw simple solig stroke
        guard dataPoints.count > 1 else {
            drawSolid(dataPoints[0].color, from: start, with: CGFloat(dataPoints[0].value))
            return
        }
        
        // We now have at least two data points to show and thus have to use gradients
        for (index, rating) in dataPoints.enumerated() {
            
            var cutOff: CGFloat = 0
            if index == 0 || index == dataPoints.count - 1 {
                cutOff = transitionSize
            } else {
                cutOff = 2 * transitionSize
            }
            
            // Offset start point by the curresnt size
            start += max(size - overlapSize, 0)
            // Subtract transition cut off from intended size
            size = max(CGFloat(rating.value) - cutOff, 0)
            // Draw the solid part of the stroke
            drawSolid(rating.color, from: start, with: size)
            
            // If we are not at the end, we should draw a gradient
            if index < dataPoints.count - 1 {
                start += size
                size = 2 * transitionSize
                let nextRating = dataPoints[index + 1]
                drawGradient(rating.color, toColor: nextRating.color, from: start, with: size)
            }
            
        }
    }
    
    func minSize(for ratings: [CirqueDataType]) -> Double {
        guard ratings.count > 1 else { return 0 }
        return (Double(ratings.count) - 1) * 2 * Double(transitionSize)
    }
}
