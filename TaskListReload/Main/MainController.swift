//
//  MainViewViewController.swift
//  TaskList
//
//  Created by Владимир Юшков on 07.09.2021.
//

import UIKit

protocol MainDelegate {
    func toggle()
}

class MainController: UIViewController, TableUpdatable {
    
    let editTaskController = EditTaskController()
    let mainView = MainView()
    
    var delegatMain: MainDelegate?
    
    var tasks = [Task]() // На данном этапе массив путой. Он будет заполнен с помощью специального метода getTasks() который мы написали чуть ниже в этом же классе.
    
    let categories = [(category: Category.importantUrgent, imageName: "hare"),
                      (category: Category.importantNotUrgent, imageName: "tortoise"),
                      (category: Category.minorUrgent, imageName: "gamecontroller"),
                      (category: Category.minorNotUrgent, imageName: "tray.circle")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
       
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) { // Используется для обновления контента таблицы как при запуске приложения так и при появлении экрана после скрытия TaskController
        super.viewWillAppear(animated)
        getTasks()
    }
    
    func getTasks() { // Наполняет пустой массив tasks задачами из базы
        tasks = RealmService.getTasks()
        mainView.tableView.reloadData()
    }
    
    func addTargets() {
        
        mainView.addButton.addTarget(self, action: #selector(addTaskTap), for: .touchUpInside)
        mainView.menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
    }
   
    @objc func addTaskTap() {
        let vc = EditTaskController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    
    @objc func menuButtonTapped() {
        delegatMain?.toggle()
    }

}

// MARK: - CollectionViewDelegate
extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellId, for: indexPath) as! CategoryCell
        
        cell.titleLabel.text = categories[indexPath.item].category.rawValue
        cell.iconView.image = UIImage(systemName: categories[indexPath.item].imageName)
        
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = categories[indexPath.item].category.rawValue // Здесь находится case выбранной категории
        var tasksForVC = [Task]()
        
        for task in tasks where task.category == category { // Находим задания в массиве tasks соответствующие выбранной пользователем категории
            tasksForVC.append(task)
        }
        
        let vc = CategoryController(category: category, task: tasksForVC)
        present(vc, animated: true, completion: nil)
        
    }
    
}

// MARK: - TableViewDelegate
extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        cell.titleLabel.text = tasks[indexPath.row].title

        switch tasks[indexPath.row].category {
        case Category.importantUrgent.rawValue:
            cell.categoryImageView.image = UIImage(systemName: SystemImages.importantUrgent.rawValue)
        case Category.importantNotUrgent.rawValue:
            cell.categoryImageView.image = UIImage(systemName: SystemImages.importantNotUrgent.rawValue)
        case Category.minorUrgent.rawValue:
            cell.categoryImageView.image = UIImage(systemName: SystemImages.minorUrgent.rawValue)
        case Category.minorNotUrgent.rawValue:
            cell.categoryImageView.image = UIImage(systemName: SystemImages.minorNotUrgent.rawValue)
        default:
            cell.categoryImageView.image = UIImage(systemName: SystemImages.minorNotUrgent.rawValue)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskController(task: tasks[indexPath.row])
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: "Done!") { _, _, completion in
            RealmService.makeComplete(task: self.tasks[indexPath.row]) {
                self.tasks = RealmService.getTasks()
                self.mainView.tableView.reloadData()
            }
            
            print("Task \(indexPath.row) has been done")
        }
        
        let config = UISwipeActionsConfiguration(actions: [doneAction])
        
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            
            let alert = UIAlertController(title: "Delete task", message: "Are you sure?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
                
                let deleatedTask = self.tasks[indexPath.row]
                RealmService.delete(task: deleatedTask) { 
                    print("Task \(indexPath.row) has been deleted")
                    self.getTasks()
                }
            })
            
            let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
            
            alert.addAction(noAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true, completion: nil)

            
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
}


