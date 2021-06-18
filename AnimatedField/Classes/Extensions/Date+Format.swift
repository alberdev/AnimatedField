//
//  Date+Format.swift
//  AnimatedField
//
//  Created by Alberto Aznar de los Ríos on 03/04/2019.
//

import Foundation

extension Date {
    
    func format(dateFormat: String, isPersian: Bool) -> String {
        let dateFormatter = DateFormatter()
        if isPersian {
            dateFormatter.calendar = Calendar(identifier: .persian)
            dateFormatter.locale = Locale(identifier: "fa_IR")
        }
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
