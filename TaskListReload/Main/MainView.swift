//
//  MainView.swift
//  TaskList
//
//  Created by Владимир Юшков on 07.09.2021.
//

import UIKit

class MainView: UIView {
    
    let menuButton = UIButton(title: "Menu", bgColor: UIColor(named: MWColors.blueButton.rawValue)!, textColor: .white, font: FontPaletts.textField)
    let addButton = UIButton(title: "+", bgColor: UIColor(named: MWColors.blueButton.rawValue)!, textColor: .white, font: FontPaletts.bigButton)
    let titleLabel = UILabel(text: "My tasks", font: FontPaletts.header)
    
    let collectionView = CategoriesCollectionView()
    let tableView = TasksTableView()
    
    init() {
        super.init(frame: CGRect())
        
        setViews()
        setConstrains()
        
    }
    
    func setViews() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 12
        layer.shadowOpacity = 0.4
       
        backgroundColor = UIColor(named: MWColors.lightGray.rawValue)!
        collectionView.backgroundColor = .clear

        titleLabel.textAlignment = .center
        
        let topButtons = [menuButton, addButton]
        for button in topButtons {
            button.layer.cornerRadius = 32
        }
    }
    
    func setConstrains() {
        
        let topStack = UIStackView(views: [menuButton, titleLabel, addButton],
                                   axis: .horizontal,
                                   spacing: 16)
                

        Helper.addSubviews(views: [topStack, collectionView, tableView], to: self)
        Helper.switchTamicOffFor([menuButton, addButton, titleLabel,topStack, collectionView, tableView])
        
        NSLayoutConstraint.activate([topStack.topAnchor.constraint(equalTo: topAnchor, constant: 48),
                                     topStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     topStack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     topStack.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([menuButton.widthAnchor.constraint(equalToConstant: 64),
                                     addButton.widthAnchor.constraint(equalTo: menuButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 8),
                                     collectionView.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
                                     collectionView.centerXAnchor.constraint(equalTo: topStack.centerXAnchor),
                                     collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
                                     tableView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
                                     tableView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
    

    
    
    
