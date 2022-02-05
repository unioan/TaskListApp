//
//  TaskTableView.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 06.10.2021.
//

import UIKit

class TasksTableView: UITableView {
    
    init() {
        super.init(frame: CGRect(), style: .plain)
        
        register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseId)
        backgroundColor = .clear
        separatorStyle = .none
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


