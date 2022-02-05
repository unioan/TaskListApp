//
//  RealmService.swift
//  TaskListReload
//
//  Created by Владимир Юшков on 12.10.2021.
//

import Foundation
import RealmSwift

class RealmService {
    
    static let realm = try! Realm()  // Это точка входа в базу
    // Чтобы использовать realm внутри статической функции мы должны сделать realm тоже статическим
    
    static func write(task: Task, compeation: () -> ()) {
        
        try! RealmService.realm.write {
            realm.add(task)
            compeation()
        }
        
    }
    
    static func getTasks() -> [Task] {
        let taskResults = realm.objects(Task.self)
        
        var uncompleatedTasks = [Task]()
        
        for task in taskResults where !task.isDone! {
            uncompleatedTasks.append(task)
        }
        return uncompleatedTasks
    }
    
    static func getCompleatedTasks(compleation: ([Task]) -> ()){
        let results = realm.objects(Task.self) // Получаем Tasks из базы

        var compleatedTasks = [Task]()
        
        for task in results where task.isDone! {
            compleatedTasks.append(task)
        }
        
        compleation(compleatedTasks)
        
    }
    
    static func delete(task: Task, compleation: () -> ()) {
        
        try! RealmService.realm.write({
            realm.delete(task)
            compleation()
        })
        
    }
    
    static func update(_ task: Task, title: String, descript: String, category: String, compleation: () -> ()) {
        try! RealmService.realm.write {

            task.title = title
            task.descript = descript
            task.category = category
            realm.add(task, update: .modified) 
            compleation()
        }
    }
    
    static func makeComplete(task: Task, compleation: () -> ()) {
        try! RealmService.realm.write({
            task.isDone?.toggle()
            realm.add(task, update: .modified)
            compleation()
        })
    }
    
}
