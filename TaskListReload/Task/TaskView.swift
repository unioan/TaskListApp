//
//  TaskView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 08.10.2021.
//

import UIKit

class TaskView: UIView {
    
    let backButton = UIButton(title: "", bgColor: .clear, textColor: UIColor(named: MWColors.blueButton.rawValue)!, font: FontPaletts.textField)
    let editButton = UIButton(type: .system)
    let readyButton = UIButton(title: "Compleated", bgColor: .systemGreen, textColor: .white, font: FontPaletts.bigButton)
    let deleteButton = UIButton(title: "Delete", bgColor: .systemRed, textColor: .white, font: FontPaletts.bigButton)
    
    let titleLabel = UILabel(text: "Task title", font: FontPaletts.header)
    let categoryTitle = UILabel(text: "Important Urgent", font: FontPaletts.bigButton)
    let textView = UITextView()

    
    init() {
        super.init(frame: CGRect())
        
        setViews()
        setConstraints()
        
    }
    
    func setViews() {
        
        backgroundColor = .white
        
        backButton.setBackgroundImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        backButton.layer.cornerRadius = 32
        
        editButton.setBackgroundImage(UIImage(systemName: "pencil.circle"), for: .normal)
        editButton.tintColor = UIColor(named: MWColors.blueButton.rawValue)!
        editButton.layer.cornerRadius = 32
        
        textView.isEditable = false
        textView.text = Helper.loremIpsum
        
    }
    
    func setConstraints() {
        
        let bottomStack = UIStackView(views: [deleteButton, readyButton], axis: .horizontal, spacing: 18)
        let stack = UIStackView(views: [titleLabel, categoryTitle, textView, bottomStack], axis: .vertical, spacing: 16)
        
        Helper.switchTamicOffFor([backButton, editButton, bottomStack, deleteButton, readyButton, stack, titleLabel, categoryTitle, textView])
        Helper.addSubviews(views: [backButton, editButton, stack], to: self)
        
        NSLayoutConstraint.activate([editButton.topAnchor.constraint(equalTo: topAnchor, constant: 48),
                                     editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                                     editButton.heightAnchor.constraint(equalToConstant: 64),
                                     editButton.widthAnchor.constraint(equalToConstant: 64)

        ])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: topAnchor, constant: 48),
                                     backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     backButton.heightAnchor.constraint(equalToConstant: 64),
                                     backButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([stack.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 24),
                                     stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.heightAnchor.constraint(equalToConstant: 400)

        ])
        
        NSLayoutConstraint.activate([deleteButton.heightAnchor.constraint(equalToConstant: 64),
                                     readyButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
                                     readyButton.heightAnchor.constraint(equalTo: deleteButton.heightAnchor)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
