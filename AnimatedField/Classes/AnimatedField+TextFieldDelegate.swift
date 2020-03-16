//
//  AnimatedField+Delegate.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 03/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

extension AnimatedField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Priorize datasource returns
        if let shouldChange = dataSource?.animatedField(self, shouldChangeCharactersIn: range, replacementString: string) {
            return shouldChange
        }
        
        // Copy new character
        var newInput = string
        
        // Replace special characters in newInput
        newInput = newInput.replacingOccurrences(of: "`", with: "")
        newInput = newInput.replacingOccurrences(of: "^", with: "")
        newInput = newInput.replacingOccurrences(of: "¨", with: "")
        
        // Replace special characters in textField
        textField.text = textField.text?.replacingOccurrences(of: "`", with: "")
        textField.text = textField.text?.replacingOccurrences(of: "^", with: "")
        textField.text = textField.text?.replacingOccurrences(of: "¨", with: "")
        
        // Apply uppercased & lowercased if available
        if uppercased { newInput = newInput.uppercased() }
        if lowercased { newInput = newInput.lowercased() }
        
        // Limits & Regular expressions
        let limit = dataSource?.animatedFieldLimit(self) ?? Int.max
        let typingExpression = "\(type.typingExpression)+"
        let regex = dataSource?.animatedFieldTypingMatches(self) ?? typingExpression
        
        // Check regular expression
        if !newInput.isValidWithRegEx(regex) && newInput != "" { return false }
        
        // Change textfield in manual mode in case of changing newInput. Check limits also
        if newInput != string {
            textField.text = textField.text?.count ?? 0 + newInput.count <= limit ? "\(textField.text ?? "")\(newInput)" : textField.text
            return false
        }
        
        // Check price (if case)
        if newInput != "", case let AnimatedFieldType.price(maxPrice, maxDecimals) = type {
            
            let newText = "\(textField.text ?? "")\(newInput)"
        
            if let price = formatter.number(from: newText) {
                let components = newText.components(separatedBy: Locale.current.decimalSeparator ?? ".")
                if components.count > 1 {
                    if components[1].count > maxDecimals {
                        return false
                    }
                }
                if price.doubleValue > maxPrice {
                    // return false
                }
            }
        }
        
        if newInput == "" { return true }
        
        // Check limits
        return textField.text?.count ?? 0 + newInput.count < limit
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return dataSource?.animatedFieldShouldReturn(self) ?? true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if !format.titleAlwaysVisible && textField.text?.count == 0 { animateIn() }
        hideAlert()
        highlightField(true)
        delegate?.animatedFieldDidBeginEditing(self)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if !format.titleAlwaysVisible && textField.text?.count == 0 { animateOut() }
        highlightField(false)
        delegate?.animatedFieldDidEndEditing(self)
        
        if let error = validateText(textField.text) {
            showAlert(error)
            delegate?.animatedField(self, didShowAlertMessage: error)
        }
    }
}
