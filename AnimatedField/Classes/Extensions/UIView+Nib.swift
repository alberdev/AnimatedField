//
//  UIView+Nib.swift
//  FashTime
//
//  Created by Alberto Aznar de los Ríos on 02/04/2019.
//  Copyright © 2019 FashTime Ltd. All rights reserved.
//

import UIKit

extension UIView {
    
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle.module.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fixConstraintsInView(self)
        return contentView
    }
    
    func fixConstraintsInView(_ container: UIView!) -> Void {
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
