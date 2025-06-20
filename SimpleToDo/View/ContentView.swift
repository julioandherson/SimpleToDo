//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ToDoListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $viewModel.newTaskTitle,onCommit: {
                        viewModel.addTask()
                    })
                    .padding()
                    Button(action: viewModel.addButtonTapped) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(viewModel.newTaskTitle.isEmpty)
                    .padding()
                }
                
                List {
                    ForEach(viewModel.todos) { todo in
                        ToDoItemView(todo: todo, viewModel: viewModel)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}

#Preview {
    ContentView()
}
