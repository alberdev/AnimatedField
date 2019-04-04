//
//  UIView+Shake.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 03/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

extension UIView {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.4
        animation.values = [-5.0, 5.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
