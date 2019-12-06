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
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var emailAnimatedField: AnimatedField!
    @IBOutlet weak var usernameAnimatedField: AnimatedField!
    @IBOutlet weak var birthdateAnimatedField: AnimatedField!
    @IBOutlet weak var passwordAnimatedField: AnimatedField!
    @IBOutlet weak var password2AnimatedField: AnimatedField!
    @IBOutlet weak var priceAnimatedField: AnimatedField!
    @IBOutlet weak var urlAnimatedField: AnimatedField!
    @IBOutlet weak var numberAnimatedField: AnimatedField!
    @IBOutlet weak var multilineAnimatedField: AnimatedField!
    @IBOutlet weak var defaultField: AnimatedField!
    @IBOutlet weak var multilineHeightConstraint: NSLayoutConstraint!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTap()
        continueButton.layer.cornerRadius = 5
        
        var format = AnimatedFieldFormat()
        format.titleFont = UIFont(name: "AvenirNext-Regular", size: 14)!
        format.textFont = UIFont(name: "AvenirNext-Regular", size: 16)!
        format.alertColor = .red
        format.alertFieldActive = false
        format.titleAlwaysVisible = true
        format.alertFont = UIFont(name: "AvenirNext-Regular", size: 14)!
        
        emailAnimatedField.format = format
        emailAnimatedField.placeholder = "Write your email"
        emailAnimatedField.dataSource = self
        emailAnimatedField.delegate = self
        emailAnimatedField.type = .email
        emailAnimatedField.tag = 0
        
        usernameAnimatedField.format = format
        usernameAnimatedField.placeholder = "Write your username"
        usernameAnimatedField.dataSource = self
        usernameAnimatedField.delegate = self
        usernameAnimatedField.lowercased = true
        usernameAnimatedField.type = .username(4, 10)
        usernameAnimatedField.tag = 1
        
        birthdateAnimatedField.format = format
        birthdateAnimatedField.placeholder = "Select your birthday"
        birthdateAnimatedField.dataSource = self
        birthdateAnimatedField.delegate = self
        
        let defaultDate = Date().addingTimeInterval(-20 * 365 * 24 * 60 * 60)
        let minDate = Date().addingTimeInterval(-90 * 365 * 24 * 60 * 60)
        let maxDate = Date().addingTimeInterval(-13 * 365 * 24 * 60 * 60)
        let chooseText = "Choose"
        let dateFormat = "dd / MM / yyyy"
        birthdateAnimatedField.type = .datepicker(.dateAndTime, defaultDate, minDate, maxDate, chooseText, dateFormat)
        birthdateAnimatedField.tag = 2
    
        numberAnimatedField.format = format
        numberAnimatedField.placeholder = "Select your age"
        numberAnimatedField.dataSource = self
        numberAnimatedField.delegate = self
        numberAnimatedField.type = .numberpicker(19, 16, 100, chooseText)
        numberAnimatedField.tag = 3
        
        passwordAnimatedField.format = format
        passwordAnimatedField.placeholder = "New password (min 6, max 10)"
        passwordAnimatedField.dataSource = self
        passwordAnimatedField.delegate = self
        passwordAnimatedField.type = .password(6, 10)
        passwordAnimatedField.isSecure = true
        passwordAnimatedField.showVisibleButton = true
        passwordAnimatedField.tag = 4
        
        password2AnimatedField.format = format
        password2AnimatedField.placeholder = "Repeat password"
        password2AnimatedField.dataSource = self
        password2AnimatedField.delegate = self
        password2AnimatedField.type = .password(6, 10)
        password2AnimatedField.isSecure = true
        password2AnimatedField.tag = 5
        
        priceAnimatedField.format = format
        priceAnimatedField.placeholder = "Write the price"
        priceAnimatedField.dataSource = self
        priceAnimatedField.delegate = self
        priceAnimatedField.type = .price(100, 2)
        priceAnimatedField.tag = 6
        
        urlAnimatedField.format = format
        urlAnimatedField.placeholder = "Write your url web"
        urlAnimatedField.dataSource = self
        urlAnimatedField.delegate = self
        urlAnimatedField.type = .url
        urlAnimatedField.tag = 7
        
        multilineAnimatedField.format = format
        multilineAnimatedField.format.counterEnabled = true
        multilineAnimatedField.format.countDown = true
        multilineAnimatedField.placeholder = "This is multiline"
        multilineAnimatedField.dataSource = self
        multilineAnimatedField.delegate = self
        multilineAnimatedField.type = .multiline
        multilineAnimatedField.tag = 8
        
        defaultField.format = format
        defaultField.placeholder = "This is a no-type field"
        defaultField.dataSource = self
        defaultField.delegate = self
        defaultField.isSecure = true
        defaultField.tag = 9
    }
    
    @IBAction func didPressContinueButton(_ sender: UIButton) {
        print("Can continue")
    }
}


extension ViewController: AnimatedFieldDelegate {
    
    func animatedFieldDidBeginEditing(_ animatedField: AnimatedField) {
        let offset = animatedField.frame.origin.y + animatedField.frame.size.height - (view.frame.height - 350)
        scrollView.setContentOffset(CGPoint(x: 0, y: offset < 0 ? 0 : offset), animated: true)
    }
    
    func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        var offset: CGFloat = 0
        if animatedField.frame.origin.y + animatedField.frame.size.height > scrollView.frame.height {
            offset = animatedField.frame.origin.y + animatedField.frame.size.height - scrollView.frame.height + 10
        }
        scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        
        let validEmailUser = emailAnimatedField.isValid && usernameAnimatedField.isValid
        continueButton.isEnabled = validEmailUser
        continueButton.alpha = validEmailUser ? 1.0 : 0.3
    }
    
    func animatedField(_ animatedField: AnimatedField, didResizeHeight height: CGFloat) {
        multilineHeightConstraint.constant = height
        view.layoutIfNeeded()
        
        let offset = animatedField.frame.origin.y + height - (view.frame.height - 350)
        scrollView.setContentOffset(CGPoint(x: 0, y: offset < 0 ? 0 : offset), animated: false)
    }
    
    func animatedField(_ animatedField: AnimatedField, didSecureText secure: Bool) {
        if animatedField == passwordAnimatedField {
            password2AnimatedField.secureField(secure)
        }
    }
    
    func animatedField(_ animatedField: AnimatedField, didChangePickerValue value: String) {
        numberAnimatedField.text = value
    }
}

extension ViewController: AnimatedFieldDataSource {
    
    func animatedFieldLimit(_ animatedField: AnimatedField) -> Int? {
        switch animatedField.tag {
        case 1: return 10
        case 8: return 300
        default: return nil
        }
    }
    
    func animatedFieldValidationError(_ animatedField: AnimatedField) -> String? {
        if animatedField == emailAnimatedField {
            return "Email invalid! Please check again ;)"
        }
        return nil
    }
}

