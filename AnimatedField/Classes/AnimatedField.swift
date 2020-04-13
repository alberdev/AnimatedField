//
//  AnimatedField.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import UIKit

extension UIToolbar {
	
	convenience init(target: Any, selector: Selector) {
		
		let rect = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 44.0)
		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: selector)
		
		self.init(frame: rect)
		barStyle = .black
		tintColor = .white
		setItems([flexible, barButton], animated: false)
	}
}

open class AnimatedField: UIView {
    
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var textFieldRightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var alertLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var eyeButton: UIButton!
    @IBOutlet weak private var lineView: UIView!
    @IBOutlet weak private var textView: UITextView!
    @IBOutlet weak private var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var titleLabelTextFieldConstraint: NSLayoutConstraint?
    @IBOutlet weak private var titleLabelTextViewConstraint: NSLayoutConstraint?
    @IBOutlet weak private var counterLabelTextFieldConstraint: NSLayoutConstraint?
    @IBOutlet weak private var counterLabelTextViewConstraint: NSLayoutConstraint?
    @IBOutlet private var alertLabelBottomConstraint: NSLayoutConstraint!
    
    /// Date picker values
    private var datePicker: UIDatePicker?
    private var initialDate: Date?
    private var dateFormat: String?
    
    /// Picker values
    private var numberPicker: UIPickerView?
    var numberOptions = [Int]()
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        return formatter
    }
	
	var isPlaceholderVisible = false {
		didSet {
			
			guard isPlaceholderVisible else {
				textField.placeholder = ""
				textField.attributedPlaceholder = nil
				return
			}
			
			if let attributedString = attributedPlaceholder {
				textField.attributedPlaceholder = attributedString
			} else {
				textField.placeholder = placeholder
			}
		}
	}
	
    /// Placeholder
    public var placeholder = "" {
        didSet {
            setupTextField()
            setupTextView()
            setupTitle()
        }
    }
	
	/// The styled string that is displayed when there is no other text in the text field.
	///
	/// This property is nil by default. If set, the placeholder string is drawn using system-defined
	/// color and the remaining style information (except the text color) of the attributed string.
	/// Assigning a new value to this property also replaces the value of the placeholder property with
	/// the same string data, albeit without any formatting information. Assigning a new value to this
	/// property does not affect any other style-related properties of the text field.
	public var attributedPlaceholder: NSAttributedString? {
		didSet {
			placeholder = attributedPlaceholder?.string ?? ""
            setupTextField()
            setupTextView()
            setupTitle()
        }
	}
	
	/// The input accessory view for this field
	public var accessoryView: UIView? {
		didSet {
			textField.inputAccessoryView = accessoryView
			textView.inputAccessoryView = accessoryView
		}
	}
	
    /// Field type (default values)
    public var type: AnimatedFieldType = .none {
        didSet {
            if case let AnimatedFieldType.datepicker(mode, defaultDate, minDate, maxDate, chooseText, format) = type {
                initialDate = defaultDate
                dateFormat = format
                setupDatePicker(mode: mode, minDate: minDate, maxDate: maxDate, chooseText: chooseText)
            }
            if case let AnimatedFieldType.numberpicker(defaultNumber, minNumber, maxNumber, chooseText) = type {
                setupPicker(defaultNumber: defaultNumber, minNumber: minNumber, maxNumber: maxNumber, chooseText: chooseText)
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
            if case AnimatedFieldType.multiline = type {
                showTextView(true)
                setupTextViewConstraints()
            } else {
                showTextView(false)
                setupTextFieldConstraints()
            }
        }
    }
	
	public var keyboardAppearance: UIKeyboardAppearance = .default {
		didSet {
			textField.keyboardAppearance = keyboardAppearance
			textView.keyboardAppearance = keyboardAppearance
		}
	}
    
    /// Uppercased field format
    public var uppercased = false
    
    /// Lowercased field format
    public var lowercased = false
    
    /// Keyboard type
    public var keyboardType = UIKeyboardType.alphabet {
        didSet { textField.keyboardType = keyboardType }
    }
	
	public var keyboardToolbar: UIToolbar? {
		didSet { textField.inputView = keyboardToolbar }
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
    
    /// Result of regular expression validation
    public var isValid: Bool {
        get { return !(validateText(textField.isHidden ? textView.text : textField.text) != nil) }
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
            textView.font = format.textFont
            textView.textColor = format.textColor
            lineView.backgroundColor = format.lineColor
            eyeButton.tintColor = format.textColor
            counterLabel.isHidden = !format.counterEnabled
            counterLabel.font = format.counterFont
            counterLabel.textColor = format.counterColor
            alertLabel.font = format.alertFont
            alertLabelBottomConstraint.isActive = format.alertPosition == .top
        }
    }
    
    open var text: String? {
        get {
            return textField.isHidden ? (textView.text == placeholder && textView.textColor == UIColor.lightGray.withAlphaComponent(0.8) ? "" : textView.text) : textField.text
        }
        set {
            textField.text = textField.isHidden ? nil : newValue
            textView.text = textView.isHidden ? "" : newValue
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
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateCounterLabel()
    }
    
    private func commonInit() {
        _ = fromNib()
        setupView()
        setupTextField()
        setupTextView()
        setupTitle()
        setupLine()
        setupEyeButton()
        setupAlertTitle()
        showTextView(false)
    }
    
    private func setupView() {
        backgroundColor = .clear
    }
    
    private func setupTextField() {
        textField.delegate = self
        textField.textColor = format.textColor
        textField.tag = tag
        textField.backgroundColor = .clear
		isPlaceholderVisible = !format.titleAlwaysVisible
    }
    
    private func setupTitle() {
        titleLabel.text = placeholder
        titleLabel.alpha = format.titleAlwaysVisible ? 1.0 : 0.0
    }
    
    private func setupTextView() {
        textView.delegate = self
        // textView.textColor = format.textColor
        textView.tag = tag
        textView.textContainerInset = .zero
        textView.contentInset = UIEdgeInsets(top: 3, left: -5, bottom: 6, right: 0)
        textViewDidChange(textView)
        endTextViewPlaceholder()
    }
    
    private func showTextView(_ show: Bool) {
        textField.isHidden = show
        textField.text = show ? nil : ""
        textView.isHidden = !show
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
    
    private func setupTextFieldConstraints() {
        titleLabelTextFieldConstraint?.isActive = true
        counterLabelTextFieldConstraint?.isActive = true
        titleLabelTextViewConstraint?.isActive = false
        counterLabelTextViewConstraint?.isActive = false
        layoutIfNeeded()
    }
    
    private func setupTextViewConstraints() {
        titleLabelTextFieldConstraint?.isActive = false
        counterLabelTextFieldConstraint?.isActive = false
        titleLabelTextViewConstraint?.isActive = true
        counterLabelTextViewConstraint?.isActive = true
        layoutIfNeeded()
    }
    
    private func setupDatePicker(mode: UIDatePicker.Mode?, minDate: Date?, maxDate: Date?, chooseText: String?) {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = mode ?? .date
        datePicker?.maximumDate = maxDate
        datePicker?.minimumDate = minDate
        datePicker?.setValue(format.textColor, forKey: "textColor")
        
        let toolBar = UIToolbar(target: self, selector: #selector(didChooseDatePicker))
		
        textField.inputAccessoryView = accessoryView ?? toolBar
        textField.inputView = datePicker
    }
    
    private func setupPicker(defaultNumber: Int, minNumber: Int, maxNumber: Int, chooseText: String?) {
        
        numberPicker = UIPickerView()
        numberPicker?.dataSource = self
        numberPicker?.delegate = self
        numberPicker?.setValue(format.textColor, forKey: "textColor")
        
        numberOptions += minNumber...maxNumber
        if let index = numberOptions.firstIndex(where: {$0 == defaultNumber}) {
            numberPicker?.selectRow(index, inComponent:0, animated:false)
        }
        
		let toolBar = UIToolbar(target: self, selector: #selector(didChooseNumberPicker))
		
        textField.inputAccessoryView = accessoryView ?? toolBar
        textField.inputView = numberPicker
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
    
    @IBAction func didChangeTextField(_ sender: UITextField) {
        updateCounterLabel()
        delegate?.animatedFieldDidChange(self)
    }
    
    @objc func didChooseDatePicker() {
        let date = datePicker?.date ?? initialDate
        textField.text = date?.format(dateFormat: dateFormat ?? "dd / MM / yyyy")
        _ = resignFirstResponder()
    }
    
    @objc func didChooseNumberPicker() {
//        textField.text = numberPicker
        _ = resignFirstResponder()
    }
}

// CLASS METHODS

extension AnimatedField {
    
    func animateIn() {
        isPlaceholderVisible = false
        titleLabelTextViewConstraint?.constant = 1
        titleLabelTextFieldConstraint?.constant = 1
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.titleLabel.alpha = 1.0
            self?.layoutIfNeeded()
        }
    }
    
    func animateOut() {
        isPlaceholderVisible = true
        titleLabelTextViewConstraint?.constant = -20
        titleLabelTextFieldConstraint?.constant = -20
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
            if (self?.format.titleAlwaysVisible ?? true) {
                self?.titleLabel.alpha = 0.0
            }
            self?.alertLabel.alpha = 1.0
        }) { [weak self] (completed) in
            self?.alertLabel.shake()
        }
    }
    
    func animateOutAlert() {
        alertLabel.text = ""
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.titleLabel.alpha = 1.0
            self?.alertLabel.alpha = 0.0
        }
    }
    
    func updateCounterLabel() {
        let count = textView.text == attributedPlaceholder?.string && textView.textColor == UIColor.lightGray.withAlphaComponent(0.8) ? (textView.text.count - (attributedPlaceholder?.string.count ?? 0)) : textView.text.count
        let value = (dataSource?.animatedFieldLimit(self) ?? 0) - count
        counterLabel.text = format.countDown ? "\(value)" : "\((textField.text?.count ?? 0) + 1)/\(dataSource?.animatedFieldLimit(self) ?? 0)"
        if format.counterAnimation {
            counterLabel.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.counterLabel.transform = .identity
            }
        }
    }
    
    func resizeTextViewHeight() {
        let size = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        textViewHeightConstraint.constant = 10 + size.height
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.layoutIfNeeded()
        }
        delegate?.animatedField(self, didResizeHeight: size.height + 10 + titleLabel.frame.size.height)
    }
    
    func endTextViewPlaceholder() {
        if textView.text == "" {
            textView.text = placeholder
            textView.textColor = UIColor.lightGray.withAlphaComponent(0.8)
        }
    }
    
    func beginTextViewPlaceholder() {
        if textView.text == placeholder && textView.textColor == UIColor.lightGray.withAlphaComponent(0.8) {
            textView.text = ""
            textView.textColor = format.textColor
        }
    }
    
    func highlightField(_ highlight: Bool) {
        guard let color = format.highlightColor else { return }
        titleLabel.textColor = highlight ? color : format.titleColor
        lineView.backgroundColor = highlight ? color : format.lineColor
    }
    
    func validateText(_ text: String?) -> String? {
        
        let validationExpression = type.validationExpression
        let regex = dataSource?.animatedFieldValidationMatches(self) ?? validationExpression
        if let text = text, text != "", !text.isValidWithRegEx(regex) {
            return dataSource?.animatedFieldValidationError(self) ?? type.validationError
        }
        
        if
            case let AnimatedFieldType.price(maxPrice, _) = type,
            let text = text,
            text != "",
            let price = formatter.number(from: text),
            price.doubleValue > maxPrice {
            return dataSource?.animatedFieldPriceExceededError(self) ?? type.priceExceededError
        }
        
        return nil
    }
}

extension AnimatedField: AnimatedFieldInterface {
    
    open func restart() {
        _ = resignFirstResponder()
        endEditing(true)
        textField.text = ""
    }
    
    open func showAlert(_ message: String? = nil) {
        guard format.alertEnabled else { return }
        textField.textColor = format.alertFieldActive ? format.alertColor : format.textColor
        lineView.backgroundColor = format.alertLineActive ? format.alertColor : format.lineColor
        animateInAlert(message)
    }
    
    open func hideAlert() {
        textField.textColor = format.textColor
        lineView.backgroundColor = format.lineColor
        animateOutAlert()
    }
    
    open func secureField(_ secure: Bool) {
        isSecure = secure
        eyeButton.setImage(secure ? format.visibleOnImage : format.visibleOffImage, for: .normal)
        delegate?.animatedField(self, didSecureText: secure)
    }
}
