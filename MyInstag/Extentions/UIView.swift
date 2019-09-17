//
//  UIView.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 14/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIButton {
    @IBInspectable  var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            //            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


