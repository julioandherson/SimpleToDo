//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id: UUID
    let title: String
    let dueDate: Date
    var isCompleted: Bool
    var dueDateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: dueDate)
    }
    
    init(id: UUID = .init(), title: String, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}
