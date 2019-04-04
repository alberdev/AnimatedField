//
//  AnimateFieldConfiguration.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

public struct AnimatedFieldFormat {
    
    /// Font for title label
    public var titleFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    /// Font for text field
    public var textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    /// Line color
    public var lineColor = UIColor.lightGray
    
    /// Title label text color
    public var titleColor = UIColor.lightGray
    
    /// TextField text color
    public var textColor = UIColor.darkGray
    
    /// Alert status color
    public var alertColor = UIColor.red
    
    /// Colored alert field text
    public var alertFieldActive = true
    
    /// Colored alert line
    public var alertLineActive = true
    
    /// Colored alert title
    public var alertTitleActive = true
    
    /// Secure icon image (On status)
    public var visibleOnImage = IconsLibrary.imageOfEye(color: .red)
    
    /// Secure icon image (Off status)
    public var visibleOffImage = IconsLibrary.imageOfEyeoff(color: .red)
    
    public init() {}
}
