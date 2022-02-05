//
//  TextFieldExt.swift
//  TaskList
//
//  Created by Владимир Юшков on 02.09.2021.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String, isShadow: Bool) {
        self.init(frame: CGRect())
        
        self.placeholder = placeholder
        font = FontPaletts.textField
        backgroundColor = .white
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 5
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 2, height: 2)
            layer.cornerRadius = 8
            
            leftView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 6, height: 2)))
            leftViewMode = .always
        }
        
    }
    
}
