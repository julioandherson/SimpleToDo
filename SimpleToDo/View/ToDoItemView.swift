//
//  ToDoItemView.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import SwiftUI
import Combine

struct ToDoItemView: View {
    let todo: ToDoItem
    @ObservedObject var viewModel: ToDoListViewModel
    
    var body: some View {
        HStack {
            
            Button(action: {
                viewModel.toggleCompletion(for: todo)
            }) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            Text(todo.title)
                .strikethrough(todo.isCompleted)
                .foregroundColor(todo.isCompleted ? .gray : nil)
            Text(todo.dueDateFormatted)
                .strikethrough(todo.isCompleted)
                .foregroundColor(todo.isCompleted ? .gray : nil)
        
            Spacer()
            
            Label(todo.priority.rawValue, systemImage: todo.priority.symbol)
                .accentColor(todo.priority.color)
        }
    }
}

#Preview {
    let viewModel = ToDoListViewModel()
    let todo = ToDoItem(title: "Task", dueDate: Date(), priority: .medium, isCompleted: true)
    ToDoItemView(todo: todo, viewModel: viewModel)
}
