//
//  StackViewExt.swift
//  TaskList
//
//  Created by Владимир Юшков on 02.09.2021.
//

import UIKit

extension UIStackView {
    
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }
    
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis) {
        
        self.init(arrangedSubviews: views)
        self.axis = axis
    }
    
}
