//
//  EditTaskView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 08.10.2021.
//

import UIKit

class EditTaskView: UIView {
    
    let titleTextField = UITextField(placeholder: "Task title", isShadow: true)
    let descriptTextView = UITextView()
    
    let isUrgentSwitch = UISwitch()
    let isImportantSwitch = UISwitch()
    let isUrgentLabel = UILabel(text: "Urgent?", font: FontPaletts.textField)
    let isImportantLabel = UILabel(text: "Important?", font: FontPaletts.textField)
    
    let createButton = UIButton(title: "Add task", bgColor: UIColor(named: MWColors.blueButton.rawValue)!, textColor: .white, font: FontPaletts.bigButton)
    
    
    init() {
        super.init(frame: CGRect())
        
        setViews()
        setConstraints()
    }
    
    func setViews() {
        
        backgroundColor = UIColor(named: MWColors.lightGray.rawValue)
        
        titleTextField.font = FontPaletts.smallHeader
        
        descriptTextView.font = FontPaletts.textField
        descriptTextView.text = "Task desctription"
        descriptTextView.textColor = .lightGray
        descriptTextView.layer.shadowColor = UIColor.black.cgColor
        descriptTextView.layer.shadowRadius = 5
        descriptTextView.layer.shadowOpacity = 0.3
        descriptTextView.layer.shadowOffset = CGSize(width: 2, height: 2)
        descriptTextView.layer.cornerRadius = 8
        
    }
    
    func setConstraints() {
        
        let isImportantStack = UIStackView(views: [isImportantSwitch, isImportantLabel], axis: .vertical, spacing: 4)
        let isUrgentStack = UIStackView(views: [isUrgentSwitch, isUrgentLabel], axis: .vertical, spacing: 4)
        let categoryStack = UIStackView(views: [isImportantStack, isUrgentStack], axis: .horizontal, spacing: 36)
        let stackView = UIStackView(views: [titleTextField, descriptTextView, categoryStack, createButton], axis: .vertical, spacing: 24)
        
        Helper.addSubviews(views: [stackView], to: self)
        Helper.switchTamicOffFor([isImportantStack, isImportantSwitch, isImportantLabel, isUrgentStack, isUrgentSwitch, isUrgentLabel, categoryStack, stackView, titleTextField, descriptTextView, createButton])
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
                                     stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
                                     stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: 450)
        ])
        
        NSLayoutConstraint.activate([titleTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([isImportantSwitch.centerXAnchor.constraint(equalTo: isImportantStack.centerXAnchor)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

