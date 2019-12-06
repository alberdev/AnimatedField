//
//  AnimatedFieldType.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import Foundation

public enum AnimatedFieldType {
    
    case none
    case email
    case username(Int, Int) // min, max
    case password(Int, Int) // min, max
    case price(Double, Int) // max price, max decimals
    case url
    case datepicker(UIDatePicker.Mode?, Date?, Date?, Date?, String?, String?) // mode, default date, min date, max date, choose text, date format
    case numberpicker(Int, Int, Int, String?) // default number, min number, max number, choose text
    case multiline
    
    var decimal: String {
        var separator = Locale.current.decimalSeparator ?? "\\."
        if separator == "." { separator = "\\." }
        return separator
    }
    
    var typingExpression: String {
        switch self {
        case .email: return "[A-Z0-9a-z@_\\.]"
        case .username: return "[A-Za-z0-9_.]"
        case .price: return "[0-9\(decimal)]"
        default: return ".*"
        }
    }
    
    var validationExpression: String {
        switch self {
        case .email: return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        case .username(let min, let max): return "[A-Za-z0-9_.]{\(min),\(max)}"
        case .password(let min, let max): return ".{\(min),\(max)}"
        case .price(_, let max): return "^(?=.*[1-9])([1-9]\\d*(?:\(decimal)\\d{1,\(max)})?|(?:0\(decimal)\\d{1,\(max)}))$"
        case .url: return "https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|www\\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9]+\\.[^\\s]{2,}|www\\.[a-zA-Z0-9]+\\.[^\\s]{2,}"
        default: return ".*"
        }
    }
    
    var validationError: String {
        switch self {
        case .email: return "Email is not valid!"
        case .username: return "Username is not valid!"
        case .password: return "Password is not valid!"
        case .price: return "Price is not valid!"
        case .url: return "Url is not valid!"
        default: return ""
        }
    }
    
    var priceExceededError: String {
        switch self {
        case .price(let maxPrice, _): return "Price exceeded limits: max \(maxPrice)"
        default: return ""
        }
    }
}
