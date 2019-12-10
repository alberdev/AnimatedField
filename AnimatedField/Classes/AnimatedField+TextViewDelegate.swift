//
//  AnimatedField+TextViewDelegate.swift
//  AnimatedField
//
//  Created by Alberto Aznar de los Ríos on 05/04/2019.
//

import Foundation

extension AnimatedField: UITextViewDelegate {
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Priorize datasource returns
        if let shouldChange = dataSource?.animatedField(self, shouldChangeCharactersIn: range, replacementString: text) {
            return shouldChange
        }
        
        // Copy new character
        var newInput = text
        
        // Replace special characters in newInput
        newInput = newInput.replacingOccurrences(of: "`", with: "")
        newInput = newInput.replacingOccurrences(of: "^", with: "")
        newInput = newInput.replacingOccurrences(of: "¨", with: "")
        
        // Replace special characters in textView
        textView.text = textView.text?.replacingOccurrences(of: "`", with: "")
        textView.text = textView.text?.replacingOccurrences(of: "^", with: "")
        textView.text = textView.text?.replacingOccurrences(of: "¨", with: "")
        
        // Apply uppercased & lowercased if available
        if uppercased { newInput = newInput.uppercased() }
        if lowercased { newInput = newInput.lowercased() }
        
        // Limits & Regular expressions
        let limit = dataSource?.animatedFieldLimit(self) ?? Int.max
        let typingExpression = type.typingExpression
        let regex = dataSource?.animatedFieldTypingMatches(self) ?? typingExpression
        
        // Check regular expression
        if !newInput.isValidWithRegEx(regex) && newInput != "" { return false }
        
        // Change textfield in manual mode in case of changing newInput. Check limits also
        if newInput != text {
            textView.text = textView.text?.count ?? 0 + newInput.count <= limit ? "\(textView.text ?? "")\(newInput)" : textView.text
            return false
        }
        
        // Check price (if case)
        if newInput != "", case let AnimatedFieldType.price(maxPrice, maxDecimals) = type {
            
            let newText = "\(textView.text ?? "")\(newInput)"
            
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
        return textView.text?.count ?? 0 + newInput.count < limit
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        resizeTextViewHeight()
        updateCounterLabel()
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        beginTextViewPlaceholder()
        if !format.titleAlwaysVisible { animateIn() }
        hideAlert()
        highlightField(true)
        delegate?.animatedFieldDidBeginEditing(self)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        endTextViewPlaceholder()
        if !format.titleAlwaysVisible { animateOut() }
        highlightField(false)
        delegate?.animatedFieldDidEndEditing(self)
        
        if let error = validateText(textView.text) {
            showAlert(error)
            delegate?.animatedField(self, didShowAlertMessage: error)
        }
    }
}
