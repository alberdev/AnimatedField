//
//  UIViewController+TapGesture.swift
//  AnimatedField_Example
//
//  Created by Alberto Aznar de los Ríos on 04/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc func hideKeyboardWhenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
