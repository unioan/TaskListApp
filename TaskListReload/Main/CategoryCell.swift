//
//  CategoryCell.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 03.10.2021.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let cellId = "cellId"
    let iconView = UIImageView(image: UIImage(systemName: "tray.circle")!)
    let titleLabel = UILabel(text: "Important urgent", font: FontPaletts.textField)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstrints()
    }
    
    
    func setViews() {
    
        backgroundColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        iconView.contentMode = .scaleAspectFit
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.4
        
        
    }
    
    func setConstrints() {
        
        let vStack = UIStackView(views: [iconView, titleLabel], axis: .vertical, spacing: 8)
        Helper.switchTamicOffFor([iconView, titleLabel, vStack])
        addSubview(vStack)
        
        NSLayoutConstraint.activate([vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     vStack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([iconView.heightAnchor.constraint(equalToConstant: 110),
                                     iconView.widthAnchor.constraint(equalToConstant: 110)
        ])
                                    
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
