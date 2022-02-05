//
//  CategoryControllerViewController.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 06.10.2021.
//

import UIKit

class CategoryController: UIViewController {
    
    let categoryView = CategoryView()
    var tasks: [Task]
    var category: String
    
    init(category: String, task: [Task]) {
        self.tasks = task
        self.category = category

        super.init(nibName: nil, bundle: nil)
        
        categoryView.tableView.delegate = self
        categoryView.tableView.dataSource = self
        
        modalPresentationStyle = .fullScreen
        categoryView.categoryTitle.text = category
        addTargets()
    }
    
    func addTargets() {
        
        categoryView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = categoryView
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = tasks[indexPath.row]
        
        let vc = TaskController(task: selectedRow)
        present(vc, animated: true, completion: nil)
    }
    
    
}
