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
    
    func toEnglish() -> String {
        let dic = [
            "۰" : "0",
            "۱" : "1" ,
            "۲" : "2",
            "۳" : "3",
            "۴" : "4",
            "۵" : "5" ,
            "۶" : "6",
            "۷" : "7",
            "۸" : "8",
            "۹" : "9"
            ] as Dictionary
        
        var result : String = self
        for (key, value) in dic {
            result = result.replacingOccurrences(of: key, with: value)
        }
        return result
    }
}
