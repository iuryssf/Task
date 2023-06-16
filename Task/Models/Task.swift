//
//  Task.swift
//  Task
//
//  Created by Iury Faria on 01/05/23.
//

import Foundation

class Task {
    let id: UUID
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }    
    
}
