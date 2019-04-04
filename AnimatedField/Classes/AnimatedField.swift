//
//  AnimatedField.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import UIKit

open class AnimatedField: UIView {
    
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var textFieldRightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var titleLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var alertLabel: UILabel!
    @IBOutlet weak private var eyeButton: UIButton!
    @IBOutlet weak private var lineView: UIView!
    
    /// Date picker values
    private var datePicker: UIDatePicker?
    private var initialDate: Date?
    private var dateFormat: String?
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        return formatter
    }
    
    /// Field type (default values)
    public var type: AnimatedFieldType? {
        didSet {
            guard let type = type else { return }
            if case let AnimatedFieldType.date(defaultDate, minDate, maxDate, chooseText, format) = type {
                initialDate = defaultDate
                dateFormat = format
                setupDatePicker(minDate: minDate, maxDate: maxDate, chooseText: chooseText)
            }
            if case AnimatedFieldType.price = type {
                keyboardType = .decimalPad
            }
            if case AnimatedFieldType.email = type {
                keyboardType = .emailAddress
            }
            if case AnimatedFieldType.url = type {
                keyboardType = .URL
            }
        }
    }
    
    /// Placeholder
    public var placeholder = "" {
        didSet { setupTextField() }
    }
    
    /// Uppercased field format
    public var uppercased = false
    
    /// Lowercased field format
    public var lowercased = false
    
    /// Keyboard type
    public var keyboardType = UIKeyboardType.alphabet {
        didSet { textField.keyboardType = keyboardType }
    }
    
    /// Secure field (dot format)
    public var isSecure = false {
        didSet { textField.isSecureTextEntry = isSecure }
    }
    
    /// Show visible button to make field unsecure
    public var showVisibleButton = false {
        didSet {
            if showVisibleButton {
                eyeButton.isHidden = false
                textFieldRightConstraint.constant = 30
                secureField(true)
            } else {
                eyeButton.isHidden = true
                textFieldRightConstraint.constant = 0
            }
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////
    /// The object that provides the data for the field view
    /// - Note: The data source must adopt the `AnimatedFieldDataSource` protocol.
    
    weak open var dataSource: AnimatedFieldDataSource?
    
    /////////////////////////////////////////////////////////////////////////////
    /// The object that acts as the delegate of the animated field view. The delegate
    /// object is responsible for managing selection behavior and interactions with
    /// individual items.
    /// - Note: The delegate must adopt the `AnimatedFieldDelegate` protocol.
    weak open var delegate: AnimatedFieldDelegate?
    
    /////////////////////////////////////////////////////////////////////////////
    /// Object that configure `AnimatedField` view. You can setup `AnimatedField` with
    /// your own parameters. See also `AnimatedFieldFormat` implementation.
    
    open var format = AnimatedFieldFormat() {
        didSet {
            titleLabel.font = format.titleFont
            titleLabel.textColor = format.titleColor
            textField.font = format.textFont
            textField.textColor = format.textColor
            lineView.backgroundColor = format.lineColor
            eyeButton.tintColor = format.textColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        _ = fromNib()
        setupTextField()
        setupLine()
        setupEyeButton()
        setupAlertTitle()
    }
    
    private func setupTextField() {
        textField.delegate = self
        textField.placeholder = placeholder
        textField.textColor = format.textColor
        textField.tag = tag
        titleLabel.alpha = 0.0
        titleLabel.text = placeholder
        titleLabelBottomConstraint.constant = -20
    }
    
    private func setupLine() {
        lineView.backgroundColor = format.lineColor
    }
    
    private func setupEyeButton() {
        showVisibleButton = false
        eyeButton.tintColor = format.textColor
    }
    
    private func setupAlertTitle() {
        alertLabel.alpha = 0.0
    }
    
    private func setupDatePicker(minDate: Date?, maxDate: Date?, chooseText: String?) {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.maximumDate = maxDate
        datePicker?.minimumDate = minDate
        datePicker?.setValue(format.textColor, forKey: "textColor")
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let chooseButton = UIBarButtonItem(title: chooseText ?? "OK", style: .plain, target: self, action: #selector(didChooseDatePicker))
        chooseButton.tintColor = format.textColor
        chooseButton.tag = 1
        toolBar.setItems([spaceButton, chooseButton], animated: false)
        
        textField.inputAccessoryView = toolBar
        textField.inputView = datePicker
    }
    
    open override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
        return super.becomeFirstResponder()
    }
    
    open override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
        return super.resignFirstResponder()
    }
    
    @IBAction func didPressEyeButton(_ sender: UIButton) {
        secureField(!textField.isSecureTextEntry)
    }
    
    @objc func didChooseDatePicker() {
        let date = datePicker?.date ?? initialDate
        textField.text = date?.format(dateFormat: dateFormat ?? "dd / MM / yyyy")
        _ = resignFirstResponder()
    }
}

// ANIMATIONS

extension AnimatedField {
    
    func animateIn() {
        textField.placeholder = ""
        titleLabelBottomConstraint.constant = 1
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.titleLabel.alpha = 1.0
            self?.layoutIfNeeded()
        }
    }
    
    func animateOut() {
        textField.placeholder = placeholder
        titleLabelBottomConstraint.constant = -20
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.titleLabel.alpha = 0.0
            self?.layoutIfNeeded()
        }
    }
    
    func animateInAlert(_ message: String?) {
        guard let message = message else { return }
        alertLabel.text = message
        alertLabel.textColor = format.alertTitleActive ? format.alertColor : format.titleColor
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.alertLabel.alpha = 1.0
        }) { [weak self] (completed) in
            self?.alertLabel.shake()
        }
    }
    
    func animateOutAlert() {
        alertLabel.text = ""
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.alertLabel.alpha = 0.0
        }
    }
}

extension AnimatedField: AnimatedFieldInterface {
    
    open func restart() {
        _ = resignFirstResponder()
        endEditing(true)
        textField.text = ""
    }
    
    open func showNormal() {
        textField.textColor = format.textColor
        lineView.backgroundColor = format.lineColor
        animateOutAlert()
    }
    
    open func showAlert(_ message: String? = nil) {
        textField.textColor = format.alertFieldActive ? format.alertColor : format.textColor
        lineView.backgroundColor = format.alertLineActive ? format.alertColor : format.lineColor
        animateInAlert(message)
    }
    
    open func secureField(_ secure: Bool) {
        isSecure = secure
        eyeButton.setImage(secure ? format.visibleOnImage : format.visibleOffImage, for: .normal)
    }
}
