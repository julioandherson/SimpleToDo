//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import Foundation
import SwiftUI

struct ToDoItem: Identifiable, Codable {
    let id: UUID
    let title: String
    let dueDate: Date
    let priority: Priority
    var isCompleted: Bool
    var dueDateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: dueDate)
    }
    
    init(id: UUID = .init(), title: String, dueDate: Date, priority: Priority, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.priority = priority
        self.isCompleted = isCompleted
    }
}

enum Priority: String, CaseIterable, Codable, Identifiable {
    case low = "Low "
    case medium = "Mid "
    case high = "High"
    
    var id: String { self.rawValue }
    
    var symbol: String {
        switch self {
            case .low:
                return "arrow.down.circle.fill"
            case .medium:
                return "arrow.right.circle.fill"
            case .high:
                return "arrow.up.circle.fill"
        }
    }

    var color: Color {
        switch self {
            case .low:
                return .green
            case .medium:
                return .yellow
            case .high:
                return .red
        }
    }
}

