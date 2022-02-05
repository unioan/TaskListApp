//
//  AuthView.swift
//  TaskList
//
//  Created by Владимир Юшков on 02.09.2021.
//

import UIKit

class AuthView: UIView {
    
    
    let titleLable = UILabel(text: "Authorization", font: FontPaletts.header)
    
    let loginTF = UITextField(placeholder: "Type login", isShadow: true)
    let passwdTF = UITextField(placeholder: "Type password", isShadow: true)
    
    let signInButton = UIButton(title: "Sign In", bgColor: .blue, textColor: .white, font: FontPaletts.bigButton)
    let signUpButton = UIButton(title: "Haven't joined yet?", bgColor: .clear, textColor: .blue, font: FontPaletts.textField)
    let forgotPassword = UIButton(title: "Forgot passford?", bgColor: .clear, textColor: .blue, font: FontPaletts.textField)
    
    let cardView = UIView()
    
    init() {
        super.init(frame: CGRect())
        
        backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        setViews()
        setConstrains()
    }
    
    func setViews() {
        passwdTF.isSecureTextEntry = true
        
        cardView.backgroundColor = .white
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 12
        cardView.layer.shadowOpacity = 0.4
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.layer.cornerRadius = 18 // скругление углов cardView (т.е. белого прямоугольника)
        
        
    }
    
    func setConstrains() {
        
        let logPassStack = UIStackView(views: [loginTF, passwdTF], axis: .vertical, spacing: 12)
        let smallButtons = UIStackView(views: [signUpButton, forgotPassword], axis: .horizontal, spacing: 12)
        let allButons = UIStackView(views: [signInButton, smallButtons], axis: .vertical, spacing: 12)
        
        Helper.addSubviews(views: [titleLable, cardView], to: self)
        Helper.addSubviews(views: [logPassStack, allButons], to: cardView)
        
        Helper.switchTamicOffFor([titleLable,
                                  cardView,
                                  logPassStack,
                                  loginTF,
                                  passwdTF,
                                  signInButton,
                                  signUpButton,
                                  forgotPassword,
                                  smallButtons,
                                  allButons
        ])
        
        

        NSLayoutConstraint.activate([titleLable.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: -36),
                                     titleLable.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     cardView.heightAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([logPassStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 36),
                                     logPassStack.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
                                     logPassStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([loginTF.heightAnchor.constraint(equalToConstant: 42),
                                     passwdTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([allButons.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -24),
                                     allButons.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
                                     allButons.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
                                     allButons.heightAnchor.constraint(equalToConstant: 90)

        ])
        
        NSLayoutConstraint.activate([forgotPassword.trailingAnchor.constraint(equalTo: smallButtons.trailingAnchor, constant: -1),
                                     signUpButton.leadingAnchor.constraint(equalTo: smallButtons.leadingAnchor, constant: 20)
        ]) 
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
