//
//  AnimatedField+UIPickerViewDelegate.swift
//  AnimatedField
//
//  Created by Alberto Aznar de los Ríos on 12/04/2019.
//

import Foundation

extension AnimatedField: UIPickerViewDataSource, UIPickerViewDelegate {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOptions.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberOptions[row])"
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.animatedField(self, didChangePickerValue: "\(numberOptions[row])")
    }
}
