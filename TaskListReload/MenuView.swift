//
//  MenuView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 28.10.2021.
//

import UIKit

class MenuView: UIView {
    
    let completeButton = UIButton(title: "Completed tasks", bgColor: .clear, textColor: UIColor(named: MWColors.blueButton.rawValue)!, font: FontPaletts.bigButton)
    
    init() {
        super.init(frame: CGRect())
        
        backgroundColor = UIColor(named: MWColors.lightGray.rawValue)!
        
        setConstraints()
    }
    
    
    func setConstraints() {
        
        addSubview(completeButton)
        Helper.switchTamicOffFor([completeButton])
        
        NSLayoutConstraint.activate([completeButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                                     completeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
