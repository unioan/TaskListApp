//
//  Task.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 07.10.2021.
//

import Foundation
import RealmSwift


class Task: Object {
    
    @Persisted var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var descript: String = ""
    @Persisted var category: String = ""
    @Persisted var isDone: Bool?

    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func createTask(title: String, descript: String, category: String) -> Task { // Требования realm чтобы инициализатор был пустым - поэтому пришлось отказаться от иницализатора. Поэтому мы создали функцию которая работает как инициализатор - внутри содается объект которому назначаются аргументы parameter list функции.
        let task = Task()
        task.title = title
        task.descript = descript
        task.category = category
        task.isDone = false
        return task
    }

}
