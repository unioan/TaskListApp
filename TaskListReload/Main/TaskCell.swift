//
//  TaskCell.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 05.10.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let reuseId = "TaskCell"
    var categoryImageView = UIImageView(image: UIImage(systemName: "gamecontroller"))
    let titleLabel = UILabel(text: "My important urgent task", font: FontPaletts.cellText)
    let cardCiew = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setViews()
        setConstraints()
    }
    
    func setViews() {
        backgroundColor = .clear
        selectionStyle = .none

        categoryImageView.contentMode = .scaleAspectFit
        cardCiew.backgroundColor = .white
        cardCiew.layer.cornerRadius = 8
    }
    
    func setConstraints() {
        
        Helper.addSubviews(views: [categoryImageView, titleLabel], to: cardCiew)
        addSubview(cardCiew)
        Helper.switchTamicOffFor([categoryImageView, titleLabel, cardCiew])
        
        NSLayoutConstraint.activate([cardCiew.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                                     cardCiew.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     cardCiew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     cardCiew.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([categoryImageView.leadingAnchor.constraint(equalTo: cardCiew.leadingAnchor, constant: 4),
                                     categoryImageView.topAnchor.constraint(equalTo: cardCiew.topAnchor, constant: 2),
                                     categoryImageView.centerYAnchor.constraint(equalTo: cardCiew.centerYAnchor),
                                     categoryImageView.widthAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 4),
                                     titleLabel.trailingAnchor.constraint(equalTo: cardCiew.trailingAnchor, constant: -4),
                                     titleLabel.centerYAnchor.constraint(equalTo: cardCiew.centerYAnchor)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
