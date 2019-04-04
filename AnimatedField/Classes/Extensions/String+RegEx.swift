//
//  String+RegEx.swift
//  AnimatedField
//
//  Created by Alberto Aznar de los Ríos on 03/04/2019.
//

import Foundation

extension String {
    
    func isValidWithRegEx(_ regEx: String) -> Bool {
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: self)
    }
}
