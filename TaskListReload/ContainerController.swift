//
//  ContainerController.swift
//  TaskList
//
//  Created by Владимир Юшков on 21.09.2021.
//

import UIKit


class ContainerController: UIViewController {

    var mainController: UIViewController!
    var menuController: UIViewController!
    
    var menuVCShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configMainVC()
        configMenuVC()
    }
    
    func configMainVC() {
        
        let mainVC = MainController()
        self.mainController = mainVC
        mainVC.delegatMain = self
        view.addSubview(mainVC.view)
        addChild(mainController)
        setConstraints()
    }
 
    func configMenuVC() {
        
        if menuController == nil {
            let menuVC = MenuController()
            menuController = menuVC
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            
            Helper.switchTamicOffFor([menuVC.view])
            NSLayoutConstraint.activate([menuVC.view.topAnchor.constraint(equalTo: view.topAnchor),
                                         menuVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                         menuVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                         menuVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            print(menuVC.view.frame.origin)
            print(menuVC.view.frame.size)
        }
        
    }
    
    func setConstraints() {
        
        Helper.switchTamicOffFor([mainController.view])
       
        NSLayoutConstraint.activate([
            mainController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainController.view.topAnchor.constraint(equalTo: view.topAnchor),
            mainController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
                
    }
    
    
    func showMenuVC(state: Bool) {
        if state {
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut) {
                self.mainController.view.frame.origin.x = 250
            } completion: { (finished) in
                print("Меню показано")
            }
        } else {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveLinear) {
                self.mainController.view.frame.origin.x = 0
            } completion: { (finished) in
                print("Меню скрыто")
            }
        }
    }
    
}

extension ContainerController: MainDelegate {
    func toggle() {
        print(#function)
        menuVCShown.toggle()
        showMenuVC(state: menuVCShown)
    }
    

}
