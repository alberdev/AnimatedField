//
//  ViewController.swift
//  AnimatedField
//
//  Created by alberdev on 04/03/2019.
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit
import AnimatedField

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailAnimatedField: AnimatedField!
    @IBOutlet weak var usernameAnimatedField: AnimatedField!
    @IBOutlet weak var birthdateAnimatedField: AnimatedField!
    @IBOutlet weak var passwordAnimatedField: AnimatedField!
    @IBOutlet weak var password2AnimatedField: AnimatedField!
    @IBOutlet weak var priceAnimatedField: AnimatedField!
    @IBOutlet weak var urlAnimatedField: AnimatedField!
    
    private var initialOriginY: CGFloat = 0
    private var keyboardHeight: CGFloat = 0
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTap()
        
        var format = AnimatedFieldFormat()
        format.titleFont = UIFont(name: "AvenirNext-Regular", size: 14)!
        format.textFont = UIFont(name: "AvenirNext-Regular", size: 16)!
        format.alertColor = .red
        format.alertFieldActive = false
        
        emailAnimatedField.format = format
        emailAnimatedField.placeholder = "Write your email"
        emailAnimatedField.dataSource = self
        emailAnimatedField.delegate = self
        emailAnimatedField.type = .email
        
        usernameAnimatedField.format = format
        usernameAnimatedField.placeholder = "Write your username"
        usernameAnimatedField.dataSource = self
        usernameAnimatedField.delegate = self
        usernameAnimatedField.lowercased = true
        usernameAnimatedField.type = .username
        
        birthdateAnimatedField.format = format
        birthdateAnimatedField.placeholder = "Select your birthday"
        birthdateAnimatedField.dataSource = self
        birthdateAnimatedField.delegate = self
        
        let defaultDate = Date().addingTimeInterval(-20 * 365 * 24 * 60 * 60)
        let minDate = Date().addingTimeInterval(-90 * 365 * 24 * 60 * 60)
        let maxDate = Date().addingTimeInterval(-13 * 365 * 24 * 60 * 60)
        let chooseText = "Choose"
        let dateFormat = "dd / MM / yyyy"
        birthdateAnimatedField.type = .date(defaultDate, minDate, maxDate, chooseText, dateFormat)
        
        passwordAnimatedField.format = format
        passwordAnimatedField.placeholder = "New password (min 6, max 10)"
        passwordAnimatedField.dataSource = self
        passwordAnimatedField.delegate = self
        passwordAnimatedField.type = .password(6, 10)
        passwordAnimatedField.isSecure = true
        passwordAnimatedField.showVisibleButton = true
        
        password2AnimatedField.format = format
        password2AnimatedField.placeholder = "Repeat password"
        password2AnimatedField.dataSource = self
        password2AnimatedField.delegate = self
        password2AnimatedField.type = .password(6, 10)
        password2AnimatedField.isSecure = true
        
        priceAnimatedField.format = format
        priceAnimatedField.placeholder = "Write the price"
        priceAnimatedField.dataSource = self
        priceAnimatedField.delegate = self
        priceAnimatedField.type = .price(100, 2)
        
        urlAnimatedField.format = format
        urlAnimatedField.placeholder = "Write your url web"
        urlAnimatedField.dataSource = self
        urlAnimatedField.delegate = self
        urlAnimatedField.type = .url
    }
}


extension ViewController: AnimatedFieldDelegate {
    
    func animatedFieldDidBeginEditing(_ animatedField: AnimatedField) {
        let offset = animatedField.frame.origin.y - view.frame.height + 400
        scrollView.setContentOffset(CGPoint(x: 0, y: offset < 0 ? 0 : offset), animated: true)
    }
    
    func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
}

extension ViewController: AnimatedFieldDataSource {
    
    
}

