//
//  IconsLibrary.swift
//  AnimatedField
//
//  Created by Alberto Aznar de los Ríos on 03/04/2019.
//

import UIKit

class IconsLibrary: NSObject {
    
    //MARK: - Canvas Drawings
    
    class func drawEye(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24), resizing: ResizingBehavior = .aspectFit, color: UIColor = .darkGray) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 24, height: 24), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 24, y: resizedFrame.height / 24)
        
        /// Combined Shape
        let combinedShape = UIBezierPath()
        combinedShape.move(to: CGPoint(x: 0.11, y: 8.55))
        combinedShape.addCurve(to: CGPoint(x: 0.89, y: 7.21), controlPoint1: CGPoint(x: 0.25, y: 8.27), controlPoint2: CGPoint(x: 0.51, y: 7.8))
        combinedShape.addCurve(to: CGPoint(x: 3.15, y: 4.32), controlPoint1: CGPoint(x: 1.53, y: 6.22), controlPoint2: CGPoint(x: 2.28, y: 5.24))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 0), controlPoint1: CGPoint(x: 5.66, y: 1.63), controlPoint2: CGPoint(x: 8.62, y: 0))
        combinedShape.addCurve(to: CGPoint(x: 20.85, y: 4.32), controlPoint1: CGPoint(x: 15.38, y: 0), controlPoint2: CGPoint(x: 18.34, y: 1.63))
        combinedShape.addCurve(to: CGPoint(x: 23.11, y: 7.21), controlPoint1: CGPoint(x: 21.72, y: 5.24), controlPoint2: CGPoint(x: 22.47, y: 6.22))
        combinedShape.addCurve(to: CGPoint(x: 23.89, y: 8.55), controlPoint1: CGPoint(x: 23.49, y: 7.8), controlPoint2: CGPoint(x: 23.75, y: 8.27))
        combinedShape.addCurve(to: CGPoint(x: 23.89, y: 9.45), controlPoint1: CGPoint(x: 24.04, y: 8.83), controlPoint2: CGPoint(x: 24.04, y: 9.17))
        combinedShape.addCurve(to: CGPoint(x: 23.11, y: 10.79), controlPoint1: CGPoint(x: 23.75, y: 9.73), controlPoint2: CGPoint(x: 23.49, y: 10.2))
        combinedShape.addCurve(to: CGPoint(x: 20.85, y: 13.68), controlPoint1: CGPoint(x: 22.47, y: 11.78), controlPoint2: CGPoint(x: 21.72, y: 12.76))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 18), controlPoint1: CGPoint(x: 18.34, y: 16.37), controlPoint2: CGPoint(x: 15.38, y: 18))
        combinedShape.addCurve(to: CGPoint(x: 3.15, y: 13.68), controlPoint1: CGPoint(x: 8.62, y: 18), controlPoint2: CGPoint(x: 5.66, y: 16.37))
        combinedShape.addCurve(to: CGPoint(x: 0.89, y: 10.79), controlPoint1: CGPoint(x: 2.28, y: 12.76), controlPoint2: CGPoint(x: 1.53, y: 11.78))
        combinedShape.addCurve(to: CGPoint(x: 0.11, y: 9.45), controlPoint1: CGPoint(x: 0.51, y: 10.2), controlPoint2: CGPoint(x: 0.25, y: 9.73))
        combinedShape.addCurve(to: CGPoint(x: 0.11, y: 8.55), controlPoint1: CGPoint(x: -0.04, y: 9.17), controlPoint2: CGPoint(x: -0.04, y: 8.83))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 2.57, y: 9.71))
        combinedShape.addCurve(to: CGPoint(x: 4.6, y: 12.32), controlPoint1: CGPoint(x: 3.15, y: 10.6), controlPoint2: CGPoint(x: 3.83, y: 11.49))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 16), controlPoint1: CGPoint(x: 6.78, y: 14.63), controlPoint2: CGPoint(x: 9.25, y: 16))
        combinedShape.addCurve(to: CGPoint(x: 19.4, y: 12.32), controlPoint1: CGPoint(x: 14.75, y: 16), controlPoint2: CGPoint(x: 17.22, y: 14.63))
        combinedShape.addCurve(to: CGPoint(x: 21.43, y: 9.71), controlPoint1: CGPoint(x: 20.17, y: 11.49), controlPoint2: CGPoint(x: 20.85, y: 10.6))
        combinedShape.addCurve(to: CGPoint(x: 21.86, y: 9), controlPoint1: CGPoint(x: 21.59, y: 9.45), controlPoint2: CGPoint(x: 21.73, y: 9.22))
        combinedShape.addCurve(to: CGPoint(x: 21.43, y: 8.29), controlPoint1: CGPoint(x: 21.73, y: 8.78), controlPoint2: CGPoint(x: 21.59, y: 8.55))
        combinedShape.addCurve(to: CGPoint(x: 19.4, y: 5.68), controlPoint1: CGPoint(x: 20.85, y: 7.4), controlPoint2: CGPoint(x: 20.17, y: 6.51))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 2), controlPoint1: CGPoint(x: 17.22, y: 3.37), controlPoint2: CGPoint(x: 14.75, y: 2))
        combinedShape.addCurve(to: CGPoint(x: 4.6, y: 5.68), controlPoint1: CGPoint(x: 9.25, y: 2), controlPoint2: CGPoint(x: 6.78, y: 3.37))
        combinedShape.addCurve(to: CGPoint(x: 2.57, y: 8.29), controlPoint1: CGPoint(x: 3.83, y: 6.51), controlPoint2: CGPoint(x: 3.15, y: 7.4))
        combinedShape.addCurve(to: CGPoint(x: 2.14, y: 9), controlPoint1: CGPoint(x: 2.41, y: 8.55), controlPoint2: CGPoint(x: 2.27, y: 8.78))
        combinedShape.addCurve(to: CGPoint(x: 2.57, y: 9.71), controlPoint1: CGPoint(x: 2.27, y: 9.22), controlPoint2: CGPoint(x: 2.41, y: 9.45))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 12, y: 13))
        combinedShape.addCurve(to: CGPoint(x: 8, y: 9), controlPoint1: CGPoint(x: 9.79, y: 13), controlPoint2: CGPoint(x: 8, y: 11.21))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 5), controlPoint1: CGPoint(x: 8, y: 6.79), controlPoint2: CGPoint(x: 9.79, y: 5))
        combinedShape.addCurve(to: CGPoint(x: 16, y: 9), controlPoint1: CGPoint(x: 14.21, y: 5), controlPoint2: CGPoint(x: 16, y: 6.79))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 13), controlPoint1: CGPoint(x: 16, y: 11.21), controlPoint2: CGPoint(x: 14.21, y: 13))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 12, y: 11))
        combinedShape.addCurve(to: CGPoint(x: 14, y: 9), controlPoint1: CGPoint(x: 13.1, y: 11), controlPoint2: CGPoint(x: 14, y: 10.1))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 7), controlPoint1: CGPoint(x: 14, y: 7.9), controlPoint2: CGPoint(x: 13.1, y: 7))
        combinedShape.addCurve(to: CGPoint(x: 10, y: 9), controlPoint1: CGPoint(x: 10.9, y: 7), controlPoint2: CGPoint(x: 10, y: 7.9))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 11), controlPoint1: CGPoint(x: 10, y: 10.1), controlPoint2: CGPoint(x: 10.9, y: 11))
        combinedShape.close()
        context.saveGState()
        context.translateBy(x: 0, y: 3)
        color.setFill()
        combinedShape.fill()
        context.restoreGState()
        
        /// Combined Shape (Outline Mask)
        context.saveGState()
        combinedShape.apply(CGAffineTransform(translationX: 0, y: 3))
        combinedShape.addClip()
        
        /// COLOR/ black
        // Warning: New symbols are not supported.
        
        context.restoreGState()
        // End Combined Shape (Outline Mask)
        
        context.restoreGState()
    }
    
    class func drawEyeoff(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24), resizing: ResizingBehavior = .aspectFit, color: UIColor = .darkGray) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 24, height: 24), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 24, y: resizedFrame.height / 24)
        
        /// Combined Shape
        let combinedShape = UIBezierPath()
        combinedShape.move(to: CGPoint(x: 5.99, y: 7.4))
        combinedShape.addCurve(to: CGPoint(x: 2.14, y: 12), controlPoint1: CGPoint(x: 4.45, y: 8.7), controlPoint2: CGPoint(x: 3.15, y: 10.26))
        combinedShape.addCurve(to: CGPoint(x: 2.57, y: 12.71), controlPoint1: CGPoint(x: 2.27, y: 12.22), controlPoint2: CGPoint(x: 2.41, y: 12.46))
        combinedShape.addCurve(to: CGPoint(x: 4.6, y: 15.32), controlPoint1: CGPoint(x: 3.15, y: 13.6), controlPoint2: CGPoint(x: 3.83, y: 14.49))
        combinedShape.addCurve(to: CGPoint(x: 11.98, y: 19), controlPoint1: CGPoint(x: 6.78, y: 17.63), controlPoint2: CGPoint(x: 9.25, y: 19))
        combinedShape.addCurve(to: CGPoint(x: 16.37, y: 17.79), controlPoint1: CGPoint(x: 13.53, y: 18.97), controlPoint2: CGPoint(x: 15.04, y: 18.55))
        combinedShape.addLine(to: CGPoint(x: 14.05, y: 15.46))
        combinedShape.addCurve(to: CGPoint(x: 10.94, y: 15.95), controlPoint1: CGPoint(x: 13.13, y: 16.04), controlPoint2: CGPoint(x: 12.01, y: 16.23))
        combinedShape.addCurve(to: CGPoint(x: 8.05, y: 13.06), controlPoint1: CGPoint(x: 9.52, y: 15.59), controlPoint2: CGPoint(x: 8.41, y: 14.48))
        combinedShape.addCurve(to: CGPoint(x: 8.54, y: 9.95), controlPoint1: CGPoint(x: 7.77, y: 11.99), controlPoint2: CGPoint(x: 7.96, y: 10.87))
        combinedShape.addLine(to: CGPoint(x: 5.99, y: 7.4))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 18.64, y: 17.22))
        combinedShape.addCurve(to: CGPoint(x: 18.66, y: 17.24), controlPoint1: CGPoint(x: 18.64, y: 17.23), controlPoint2: CGPoint(x: 18.65, y: 17.24))
        combinedShape.addLine(to: CGPoint(x: 23.71, y: 22.29))
        combinedShape.addCurve(to: CGPoint(x: 23.71, y: 23.71), controlPoint1: CGPoint(x: 24.1, y: 22.68), controlPoint2: CGPoint(x: 24.1, y: 23.32))
        combinedShape.addCurve(to: CGPoint(x: 22.29, y: 23.71), controlPoint1: CGPoint(x: 23.32, y: 24.1), controlPoint2: CGPoint(x: 22.68, y: 24.1))
        combinedShape.addLine(to: CGPoint(x: 17.83, y: 19.24))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 21), controlPoint1: CGPoint(x: 16.1, y: 20.35), controlPoint2: CGPoint(x: 14.08, y: 20.97))
        combinedShape.addCurve(to: CGPoint(x: 3.15, y: 16.68), controlPoint1: CGPoint(x: 8.62, y: 21), controlPoint2: CGPoint(x: 5.66, y: 19.37))
        combinedShape.addCurve(to: CGPoint(x: 0.89, y: 13.79), controlPoint1: CGPoint(x: 2.28, y: 15.76), controlPoint2: CGPoint(x: 1.53, y: 14.78))
        combinedShape.addCurve(to: CGPoint(x: 0.11, y: 12.45), controlPoint1: CGPoint(x: 0.51, y: 13.2), controlPoint2: CGPoint(x: 0.25, y: 12.73))
        combinedShape.addCurve(to: CGPoint(x: 0.12, y: 11.53), controlPoint1: CGPoint(x: -0.04, y: 12.16), controlPoint2: CGPoint(x: -0.03, y: 11.81))
        combinedShape.addCurve(to: CGPoint(x: 4.57, y: 5.98), controlPoint1: CGPoint(x: 1.25, y: 9.42), controlPoint2: CGPoint(x: 2.76, y: 7.54))
        combinedShape.addLine(to: CGPoint(x: 0.29, y: 1.71))
        combinedShape.addCurve(to: CGPoint(x: 0.29, y: 0.29), controlPoint1: CGPoint(x: -0.1, y: 1.32), controlPoint2: CGPoint(x: -0.1, y: 0.68))
        combinedShape.addCurve(to: CGPoint(x: 1.71, y: 0.29), controlPoint1: CGPoint(x: 0.68, y: -0.1), controlPoint2: CGPoint(x: 1.32, y: -0.1))
        combinedShape.addLine(to: CGPoint(x: 6.76, y: 5.34))
        combinedShape.addCurve(to: CGPoint(x: 6.78, y: 5.36), controlPoint1: CGPoint(x: 6.76, y: 5.35), controlPoint2: CGPoint(x: 6.77, y: 5.36))
        combinedShape.addLine(to: CGPoint(x: 10.58, y: 9.17))
        combinedShape.addCurve(to: CGPoint(x: 10.59, y: 9.18), controlPoint1: CGPoint(x: 10.59, y: 9.17), controlPoint2: CGPoint(x: 10.59, y: 9.17))
        combinedShape.addLine(to: CGPoint(x: 14.82, y: 13.41))
        combinedShape.addCurve(to: CGPoint(x: 14.83, y: 13.42), controlPoint1: CGPoint(x: 14.83, y: 13.41), controlPoint2: CGPoint(x: 14.83, y: 13.41))
        combinedShape.addLine(to: CGPoint(x: 18.64, y: 17.22))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 10.03, y: 11.44))
        combinedShape.addCurve(to: CGPoint(x: 9.99, y: 12.57), controlPoint1: CGPoint(x: 9.91, y: 11.8), controlPoint2: CGPoint(x: 9.89, y: 12.19))
        combinedShape.addCurve(to: CGPoint(x: 11.43, y: 14.01), controlPoint1: CGPoint(x: 10.17, y: 13.28), controlPoint2: CGPoint(x: 10.72, y: 13.83))
        combinedShape.addCurve(to: CGPoint(x: 12.56, y: 13.97), controlPoint1: CGPoint(x: 11.81, y: 14.11), controlPoint2: CGPoint(x: 12.2, y: 14.09))
        combinedShape.addLine(to: CGPoint(x: 10.03, y: 11.44))
        combinedShape.close()
        combinedShape.move(to: CGPoint(x: 20.07, y: 14.55))
        combinedShape.addCurve(to: CGPoint(x: 21.86, y: 12), controlPoint1: CGPoint(x: 20.74, y: 13.75), controlPoint2: CGPoint(x: 21.34, y: 12.9))
        combinedShape.addCurve(to: CGPoint(x: 21.43, y: 11.29), controlPoint1: CGPoint(x: 21.73, y: 11.78), controlPoint2: CGPoint(x: 21.59, y: 11.54))
        combinedShape.addCurve(to: CGPoint(x: 19.4, y: 8.68), controlPoint1: CGPoint(x: 20.85, y: 10.4), controlPoint2: CGPoint(x: 20.17, y: 9.51))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 5), controlPoint1: CGPoint(x: 17.22, y: 6.37), controlPoint2: CGPoint(x: 14.75, y: 5))
        combinedShape.addCurve(to: CGPoint(x: 10.13, y: 5.21), controlPoint1: CGPoint(x: 11.37, y: 5), controlPoint2: CGPoint(x: 10.74, y: 5.07))
        combinedShape.addCurve(to: CGPoint(x: 8.93, y: 4.47), controlPoint1: CGPoint(x: 9.59, y: 5.34), controlPoint2: CGPoint(x: 9.05, y: 5.01))
        combinedShape.addCurve(to: CGPoint(x: 9.67, y: 3.27), controlPoint1: CGPoint(x: 8.8, y: 3.93), controlPoint2: CGPoint(x: 9.13, y: 3.39))
        combinedShape.addCurve(to: CGPoint(x: 12, y: 3), controlPoint1: CGPoint(x: 10.44, y: 3.09), controlPoint2: CGPoint(x: 11.22, y: 3))
        combinedShape.addCurve(to: CGPoint(x: 20.85, y: 7.32), controlPoint1: CGPoint(x: 15.38, y: 3), controlPoint2: CGPoint(x: 18.34, y: 4.63))
        combinedShape.addCurve(to: CGPoint(x: 23.11, y: 10.21), controlPoint1: CGPoint(x: 21.72, y: 8.24), controlPoint2: CGPoint(x: 22.47, y: 9.22))
        combinedShape.addCurve(to: CGPoint(x: 23.89, y: 11.55), controlPoint1: CGPoint(x: 23.49, y: 10.8), controlPoint2: CGPoint(x: 23.75, y: 11.27))
        combinedShape.addCurve(to: CGPoint(x: 23.88, y: 12.47), controlPoint1: CGPoint(x: 24.04, y: 11.84), controlPoint2: CGPoint(x: 24.03, y: 12.19))
        combinedShape.addCurve(to: CGPoint(x: 21.61, y: 15.83), controlPoint1: CGPoint(x: 23.24, y: 13.67), controlPoint2: CGPoint(x: 22.48, y: 14.8))
        combinedShape.addCurve(to: CGPoint(x: 20.2, y: 15.96), controlPoint1: CGPoint(x: 21.25, y: 16.26), controlPoint2: CGPoint(x: 20.62, y: 16.31))
        combinedShape.addCurve(to: CGPoint(x: 20.07, y: 14.55), controlPoint1: CGPoint(x: 19.77, y: 15.6), controlPoint2: CGPoint(x: 19.72, y: 14.97))
        combinedShape.close()
        context.saveGState()
        context.translateBy(x: -0, y: 0)
        combinedShape.usesEvenOddFillRule = true
        color.setFill()
        combinedShape.fill()
        context.restoreGState()
        
        /// Combined Shape (Outline Mask)
        context.saveGState()
        combinedShape.apply(CGAffineTransform(translationX: -0, y: 0))
        combinedShape.addClip()
        
        /// COLOR/ black
        // Warning: New symbols are not supported.
        
        context.restoreGState()
        // End Combined Shape (Outline Mask)
        
        context.restoreGState()
    }
    
    //MARK: - Canvas Images
    
    class func imageOfEye(color: UIColor = .darkGray, size: CGSize = CGSize(width: 26, height: 26)) -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        IconsLibrary.drawEye(frame: CGRect(origin: .zero, size: size), resizing: .aspectFit, color: color)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    class func imageOfEyeoff(color: UIColor = .darkGray, size: CGSize = CGSize(width: 26, height: 26)) -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        IconsLibrary.drawEyeoff(frame: CGRect(origin: .zero, size: size), resizing: .aspectFit, color: color)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    //MARK: - Resizing Behavior
    
    enum ResizingBehavior {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
    
    
}
