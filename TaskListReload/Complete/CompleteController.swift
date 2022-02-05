//
//  CompleteController.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 27.10.2021.
//

import UIKit

class CompleteController: UIViewController {
    
    let completeView = CompleteView()
    var compleatedTasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeView.tableView.delegate = self
        completeView.tableView.dataSource = self

        view = completeView
        addTargets()
        
        getCompletedTasks() 
    }
    
    func addTargets() {
        completeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
  
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func getCompletedTasks() {
        RealmService.getCompleatedTasks { compleatedTasks in
            self.compleatedTasks = compleatedTasks
            completeView.tableView.reloadData()
        }
    }
    
}

extension CompleteController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        compleatedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        cell.titleLabel.text = compleatedTasks[indexPath.row].title
        
        switch compleatedTasks[indexPath.row].category {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = TaskController(task: compleatedTasks[indexPath.row])
        vc.taskView.readyButton.isEnabled = false
        vc.taskView.readyButton.setTitle("Done", for: .disabled)
        vc.taskView.editButton.isEnabled = false
        vc.taskView.editButton.tintColor = UIColor(named: MWColors.lightGray.rawValue)
        present(vc, animated: true, completion: nil)
    }
    
    
}
