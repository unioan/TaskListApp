//
//  ViewController.swift
//  TaskList
//
//  Created by Владимир Юшков on 02.09.2021.
//

import UIKit

class AuthController: UIViewController {
    
    let authView = AuthView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = authView
        addTargets()
    }
    
    func addTargets() { // Нужно добавить target на кнопку которая находится в AuthView
        authView.signUpButton.addTarget(self, action: #selector(goToReg), for: .touchUpInside)
    }

    @objc func goToReg() {
        let vc = DetailController()
        present(vc, animated: true, completion: nil)
    }
    
}

