//
//  ToDoListViewModel.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import Combine
import SwiftUI

class ToDoListViewModel: ObservableObject {
    
    private static let todosKey = "todos"

    @Published var todos: [ToDoItem] = []
    @Published var newTaskTitle = ""
    @Published var selectedDate = Date()
    @AppStorage(todosKey) private var todosData = Data()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadTodos()
        if let decodedTodos = try? JSONDecoder().decode([ToDoItem].self, from: todosData) {
            todos = decodedTodos
        }
        $todos
            .sink { [weak self] todos in
                guard let self = self else { return }
                if let encoded = try? JSONEncoder().encode(todos) {
                    self.todosData = encoded
                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonTapped() {
        addTask()
    }
    
    func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        
        todos.append(ToDoItem(title: newTaskTitle, dueDate: selectedDate, isCompleted: false))
        newTaskTitle = ""
        selectedDate = Date()
        saveTodos()
    }
    
    func toggleCompletion(for item: ToDoItem) {
        if let index = todos.firstIndex(where: { $0.id == item.id }) {
            todos[index].isCompleted.toggle()
            saveTodos()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        saveTodos()
    }
    
    func loadTodos() {
//        if let data = UserDefaults.standard.data(forKey: todosKey) {
//            if let decodedTodos = try? JSONDecoder().decode([ToDoItem].self, from: data) {
//                todos = decodedTodos
//            }
//        }
    }
    
    func saveTodos() {
//        if let encodedTodos = try? JSONEncoder().encode(todos) {
//            UserDefaults.standard.set(encodedTodos, forKey: todosKey)
//        }
    }
}
