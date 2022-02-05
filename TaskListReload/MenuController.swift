//
//  MenuController.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 26.10.2021.
//

import UIKit

class MenuController: UIViewController {
    
    let menuView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = menuView
        addTargets()
    }
    

    func addTargets() {
        menuView.completeButton.addTarget(self, action: #selector(compleateButtonTapped), for: .touchUpInside)
    }

    
    @objc func compleateButtonTapped() {
        let vc = CompleteController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    
}
