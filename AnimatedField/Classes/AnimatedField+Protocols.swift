//
//  AnimatedField+Protocols.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

public protocol AnimatedFieldDataSource: class {
    
    /**
     ------------------------------------------------------------------------------------------
     Returns boolean to check if field can be changed
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - parameter range: character range
     - parameter string: character
     - returns: boolean
     */
    func animatedField(_ animatedField: AnimatedField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns boolean to check if field can return
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - returns: boolean
     */
    func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool
    
    /**
     ------------------------------------------------------------------------------------------
     Returns characters limit
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - returns: maximum of characters you want for this field
     */
    func animatedFieldLimit(_ animatedField: AnimatedField) -> Int?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns regular expression to filter characters when user is typing
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - returns: regular expression you want to apply to this field
     */
    func animatedFieldTypingMatches(_ animatedField: AnimatedField) -> String?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns regular expression to filter field when user ends editing
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - returns: regular expression you want to apply to this field
     */
    func animatedFieldValidationMatches(_ animatedField: AnimatedField) -> String?
    
    /**
    ------------------------------------------------------------------------------------------
    Returns alert message when validation fails
    ------------------------------------------------------------------------------------------
    - parameter animatedField: current animatedField
    - returns: validation error message
    */
    func animatedFieldValidationError(_ animatedField: AnimatedField) -> String?
    
    /**
     ------------------------------------------------------------------------------------------
     Returns alert message when price exceeded limits (only for price type)
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - returns: validation error message
     */
    func animatedFieldPriceExceededError(_ animatedField: AnimatedField) -> String?
}

public extension AnimatedFieldDataSource {
    
    func animatedField(_ animatedField: AnimatedField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool? {
        // Optional
        return nil
    }
    
    func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        // Optional
        return true
    }
    
    func animatedFieldLimit(_ animatedField: AnimatedField) -> Int? {
        // Optional
        return Int.max
    }
    
    func animatedFieldTypingMatches(_ animatedField: AnimatedField) -> String? {
        // Optional
        return nil
    }
    
    func animatedFieldValidationMatches(_ animatedField: AnimatedField) -> String? {
        // Optional
        return nil
    }
    
    func animatedFieldValidationError(_ animatedField: AnimatedField) -> String? {
        // Optional
        return nil
    }
    
    func animatedFieldPriceExceededError(_ animatedField: AnimatedField) -> String? {
        // Optional
        return nil
    }
}

public protocol AnimatedFieldDelegate: class {
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when text field begin editing
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     */
    func animatedFieldDidBeginEditing(_ animatedField: AnimatedField)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when text field end editing
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     */
    func animatedFieldDidEndEditing(_ animatedField: AnimatedField)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when field (multiline) is resized
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - parameter height: current height
     */
    func animatedField(_ animatedField: AnimatedField, didResizeHeight height: CGFloat)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when secure button is pressed
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - parameter secure: secured text
     */
    func animatedField(_ animatedField: AnimatedField, didSecureText secure: Bool)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when picker value is changed
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - parameter value: selected value text
     */
    func animatedField(_ animatedField: AnimatedField, didChangePickerValue value: String)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when alert message is shown
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     - parameter value: alert text
     */
    func animatedField(_ animatedField: AnimatedField, didShowAlertMessage text: String)
    
    /**
     ------------------------------------------------------------------------------------------
     Is called when text field changed
     ------------------------------------------------------------------------------------------
     - parameter animatedField: current animatedField
     */
    func animatedFieldDidChange(_ animatedField: AnimatedField)
    
}

public extension AnimatedFieldDelegate {
    
    func animatedFieldDidBeginEditing(_ animatedField: AnimatedField) {
        // Optional
    }
    
    func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        // Optional
    }
    
    func animatedField(_ animatedField: AnimatedField, didResizeHeight height: CGFloat) {
        // Optional
    }
    
    func animatedField(_ animatedField: AnimatedField, didSecureText secure: Bool) {
        // Optional
    }
    
    func animatedField(_ animatedField: AnimatedField, didChangePickerValue value: String) {
        // Optional
    }
    
    func animatedField(_ animatedField: AnimatedField, didShowAlertMessage text: String) {
        // Optional
    }
    
    func animatedFieldDidChange(_ animatedField: AnimatedField) {
        // Optional
    }
}

public protocol AnimatedFieldInterface {
    
    /**
     ------------------------------------------------------------------------------------------
     Restart field
     ------------------------------------------------------------------------------------------
     */
    func restart()
    
    /**
     ------------------------------------------------------------------------------------------
     Show alert status
     ------------------------------------------------------------------------------------------
     - parameter message: alert message
     */
    func showAlert(_ message: String?)
    
    /**
     ------------------------------------------------------------------------------------------
     Hide alert message
     ------------------------------------------------------------------------------------------
     */
    func hideAlert()
    
    /**
     ------------------------------------------------------------------------------------------
     Secure field with dots (no visible)
     ------------------------------------------------------------------------------------------
     */
    func secureField(_ secure: Bool)
}
