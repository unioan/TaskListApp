//
//  ViewOfVC.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 08.10.2021.
//

import UIKit


class ViewOfVC: UIView {
    
    let imageView = UIImageView(image: UIImage(systemName: "pencil.circle"))
    let button = UIButton(type: .system)
    
    let imageSystem = UIImage(systemName: "pencil.circle")
    
    
    
    init() {
        super.init(frame: CGRect())
        
        setViews()
        setConstraints()
        
    }
    

    func setViews() {
        backgroundColor = .white

        imageView.tintColor = .systemOrange

        button.setBackgroundImage(imageSystem, for: .normal)
    }
    
    func setConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        NSLayoutConstraint.activate([button.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     button.heightAnchor.constraint(equalToConstant: 64),
                                     button.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
