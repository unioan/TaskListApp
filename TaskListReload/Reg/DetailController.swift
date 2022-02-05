//
//  RegController.swift
//  TaskList
//
//  Created by Владимир Юшков on 07.09.2021.
//

import UIKit


class DetailController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = detailView
    }
    
}
