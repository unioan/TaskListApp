//
//  DetailView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 07.10.2021.
//

import UIKit

class DetailView: UIView {

    let titleLable = UILabel(text: "Do something", font: FontPaletts.header)
    let descriptionTextView = UITextView()
    let categoryLable = UILabel(text: "Important urgent", font: FontPaletts.smallHeader)
    
    
    init() {
        super.init(frame: CGRect())
        
        setViews()
    }
    

    func setViews() {
        backgroundColor = UIColor(named: MWColors.lightGray.rawValue)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
