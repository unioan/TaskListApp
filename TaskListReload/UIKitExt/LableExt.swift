//
//  LableExt.swift
//  TaskList
//
//  Created by Владимир Юшков on 02.09.2021.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont) { 
        self.init(frame: CGRect())
        self.text = text
        self.font = font
    }
    
}


