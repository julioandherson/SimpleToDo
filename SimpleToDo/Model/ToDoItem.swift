//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}
