//
//  ComleteView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 27.10.2021.
//

import UIKit

class CompleteView: UIView {
    
    let titleLabel = UILabel(text: "Completed Tasks", font: FontPaletts.header)
    let tableView = TasksTableView()
    let backButton = UIButton(title: "Back", bgColor: .clear, textColor: UIColor(named: MWColors.blueButton.rawValue)!, font: FontPaletts.textField)
    
    
    init() {
        super.init(frame: CGRect())
        
        
        setViews()
        setConstraints()
    }
    
    
    func setViews() {
        
        backgroundColor = UIColor(named: MWColors.lightGray.rawValue)

    }
    
    func setConstraints() {
        Helper.switchTamicOffFor([titleLabel, tableView, backButton])
        Helper.addSubviews(views: [titleLabel, tableView, backButton], to: self) 
        
        NSLayoutConstraint.activate([backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     backButton.topAnchor.constraint(equalTo: topAnchor, constant: 48)
                                     
        ])
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ])
        
        
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                                     tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
