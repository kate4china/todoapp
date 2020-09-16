//
//  TodoManager.swift
//  TodoApp
//
//  Created by student on 4/15/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TodoManager {
    static let sharedInstance = TodoManager()
    
    var todos = [Todo]()
    var count: Int {
        get {
            return todos.count
        }
    }
    
    var context: NSManagedObjectContext!
    
    init() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDelegate.managedObjectContext
        fetchTodos()
    }
    
    func fetchTodos() {
        let fetchRequest = NSFetchRequest(entityName: "Todo")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            todos = results as! [Todo]
        } catch let error {
            print("fetch error: \(error)")
        }
    }
    
    func todoAtIndex(index: Int) -> Todo {
        return todos[index]
    }
    
    func addNewTodoWithName(name: String) {
        let todo = NSEntityDescription.insertNewObjectForEntityForName("Todo", inManagedObjectContext: context) as! Todo
        todo.name = name
        todo.completed = false
        todos.append(todo)
        save()
    }
    
    
    func deleteTodoAtIndex(index: Int) {
        context.deleteObject(todoAtIndex(index))
        todos.removeAtIndex(index)
        save()
    }
    
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Save Error: \(error)")
        }
    }
    
}












