//
//  AnimateFieldConfiguration.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

public struct AnimatedFieldFormat {
    
    /// Title always visible
    public var titleAlwaysVisible = false
    
    /// Font for title label
    public var titleFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    /// Font for text field
    public var textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    /// Font for counter
    public var counterFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    /// Line color
    public var lineColor = UIColor.lightGray
    
    /// Title label text color
    public var titleColor = UIColor.lightGray
    
    /// TextField text color
    public var textColor = UIColor.darkGray
    
    /// Counter text color
    public var counterColor = UIColor.darkGray
    
    /// Enable alert
    public var alertEnabled = true
    
    /// Font for alert label
    public var alertFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    /// Alert status color
    public var alertColor = UIColor.red
    
    /// Colored alert field text
    public var alertFieldActive = true
    
    /// Colored alert line
    public var alertLineActive = true
    
    /// Colored alert title
    public var alertTitleActive = true
    
    /// Alert position
    public var alertPosition = AnimatedFieldAlertPosition.top
    
    /// Secure icon image (On status)
    public var visibleOnImage = IconsLibrary.imageOfEye(color: .red)
    
    /// Secure icon image (Off status)
    public var visibleOffImage = IconsLibrary.imageOfEyeoff(color: .red)
    
    /// Enable counter label
    public var counterEnabled = false
    
    /// Set count down if counter is enabled
    public var countDown = false
    
    /// Enable counter animation on change
    public var counterAnimation = false
    
    /// Highlight color when becomes active
    public var highlightColor: UIColor? = UIColor(displayP3Red: 0, green: 139/255, blue: 96/255, alpha: 1.0)
    
    public init() {}
}
