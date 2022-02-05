//
//  EditTaskController.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 08.10.2021.
//

import UIKit

protocol TableUpdatable {
    func getTasks()
}

protocol TaskControllerUpdatable {
    func updateTaskControllerView()
}

class EditTaskController: UIViewController {
    
    let editTaskView = EditTaskView()
    var task: Task?
    
    var delegate: TableUpdatable?
    var delegateTaskController: TaskControllerUpdatable?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        editTaskView.descriptTextView.delegate = self
    }
    
    init(task: Task) {
        super.init(nibName: nil, bundle: nil)
        self.task = task
        
        editTaskView.titleTextField.text = task.title
        editTaskView.descriptTextView.text = task.descript
        
        switch task.category {
        case Category.importantUrgent.rawValue:
            editTaskView.isImportantSwitch.isOn = true
            editTaskView.isUrgentSwitch.isOn = true
        case Category.importantNotUrgent.rawValue:
            editTaskView.isImportantSwitch.isOn = true
            editTaskView.isUrgentSwitch.isOn = false
        case Category.minorUrgent.rawValue:
            editTaskView.isImportantSwitch.isOn = false
            editTaskView.isUrgentSwitch.isOn = true
        case Category.minorNotUrgent.rawValue:
            editTaskView.isImportantSwitch.isOn = false
            editTaskView.isUrgentSwitch.isOn = false
        default:
            editTaskView.isImportantSwitch.isOn = false
            editTaskView.isUrgentSwitch.isOn = false

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = editTaskView
        
        if let _ = task {
            editTaskView.createButton.setTitle("Save", for: .normal)
        }
        
        addTargets()
        
    }
    
    func addTargets() {
        editTaskView.createButton.addTarget(self, action: #selector(addNewOrEditTask), for: .touchUpInside)
    }
    
    @objc func addNewOrEditTask() {
        
        if let task = self.task { // Эта ветка срабатывает когда задача существует (т.е. мы редактируем задачу)

            guard let title = editTaskView.titleTextField.text else { return }
            let descript = editTaskView.descriptTextView.text ?? ""
            
            RealmService.update(task,
                                title: title,
                                descript: descript,
                                category: getCategoryFromSwitches()) {
                delegateTaskController?.updateTaskControllerView()
                dismiss(animated: true, completion: nil)
            }
            
        } else { // Эта ветка срабатывает когда задачи не существует значит будет создана новая задача
            guard let title = editTaskView.titleTextField.text else { return }
            let descript = editTaskView.descriptTextView.text ?? ""
            
            let task = Task.createTask(title: title, descript: descript, category: getCategoryFromSwitches())
            
            RealmService.write(task: task) {
                print("Задача добавлена")
                delegate?.getTasks()
                dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func getCategoryFromSwitches() -> String { // Этот метод нужен нам чтобы передать category в метод addNew() => createTask()
        
        let urgentSwitch = editTaskView.isUrgentSwitch.isOn
        let importantSwitch = editTaskView.isImportantSwitch.isOn
        
        var category =  ""
        
        if urgentSwitch && importantSwitch {
            category = Category.importantUrgent.rawValue
        } else if !urgentSwitch && importantSwitch {
            category = Category.importantNotUrgent.rawValue
        } else if urgentSwitch && !importantSwitch {
            category = Category.minorUrgent.rawValue
        } else {
            category = Category.minorNotUrgent.rawValue
        }
        print("\(category)")
        return category
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EditTaskController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        editTaskView.descriptTextView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Task desctription"
            textView.textColor = .lightGray
        }
  
        
    }
}
