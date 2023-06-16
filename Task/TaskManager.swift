//
//  TaskManager.swift
//  Task
//
//  Created by Iury Faria on 12/05/23.
//

import Foundation

class TaskManager {
    static let shared = TaskManager()
    
    private var tasks: [Task] = []
    
    func addTask(task: Task) {
        tasks.append(task)
        saveTask()
    }
    
    private func saveTask() {
        
    }
    
    func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask(_ task: Task, title: String, date: Date) {
        task.title = title
        task.date = date
    }
    
    func markTaskAsCompleted(_ task: Task) {
        task.isCompleted = true
        
    }
    
    func taskNotCompleted() -> [Task] {
        return tasks.filter { !$0.isCompleted }
    }
    
    func tasksCompleted() -> [Task] {
        return tasks.filter { $0.isCompleted }
    }
    
    func sortTasksAlphabetically() {
        tasks.sort { $0.title.lowercased() < $1.title.lowercased() }
    }
    
    func sortTasksByDate() {
        tasks.sort { $0.date < $1.date }
    }
    
}
