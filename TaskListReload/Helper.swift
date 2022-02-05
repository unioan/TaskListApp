//
//  Helper.swift
//  TaskList
//
//  Created by Владимир Юшков on 28.09.2021.
//

import UIKit

class Helper {
    
    static func addSubviews(views: [UIView], to view: UIView) {
        for seperateView in views {
            view.addSubview(seperateView)
        }
    }
    
    static func switchTamicOffFor(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    static let loremIpsum = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
}

