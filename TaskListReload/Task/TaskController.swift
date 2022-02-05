//
//  TaskControllerViewController.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 08.10.2021.
//

import UIKit

class TaskController: UIViewController, TaskControllerUpdatable {
    
    let taskView = TaskView()
    var task: Task
    
    init(task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
        
        taskView.titleLabel.text = task.title
        taskView.textView.text = task.descript
        taskView.categoryTitle.text = task.category
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = taskView

        addTargets()
        
    }
    
    func updateTaskControllerView() {
        
        let realmArray = RealmService.getTasks()
        for task in realmArray {
            if task == self.task {
                print(task.title)
                taskView.titleLabel.text = task.title
                taskView.textView.text = task.descript
                taskView.categoryTitle.text = task.category
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TaskControllerViewController will appear")
    }
    
    func addTargets() {
        taskView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        taskView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        taskView.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        taskView.readyButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc func doneButtonTapped() {
        
        RealmService.makeComplete(task: task) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func deleteButtonTapped() {
        
        let allert = UIAlertController(title: "Are you sure deleating the task?", message: nil, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .destructive) { _ in
            
            RealmService.delete(task: self.task) {
                self.dismiss(animated: true, completion: nil)
            }
        }
        let noButton = UIAlertAction(title: "No", style: .default) { _ in
            allert.dismiss(animated: true, completion: nil)
        }
        
        allert.addAction(yesButton)
        allert.addAction(noButton)
        
        present(allert, animated: true, completion: nil)
    }
   
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func editButtonTapped() {
            let vc = EditTaskController(task: task) 
            vc.delegateTaskController = self
            present(vc, animated: true, completion: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
