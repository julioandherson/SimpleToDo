//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Júlio Andherson de Oliveira Silva on 17/06/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ToDoListViewModel()
    @State private var showDatePicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $viewModel.newTaskTitle,onCommit: {
                        viewModel.addTask()
                    })
                    .padding()
                    
                    // REMOVE
                    Image(systemName: "arrow.down.circle.fill")
                        .foregroundStyle(.green)
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundStyle(.yellow)
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundStyle(.red)
                    // REMOVE
                    
                    Button(action: viewModel.addButtonTapped) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(viewModel.newTaskTitle.isEmpty)
                    .padding()
                    
                    Button(action: {
                        showDatePicker.toggle()
                    })
                    {
                        Image(systemName: "calendar.circle.fill")
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
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
        .sheet(isPresented: $showDatePicker) {
            VStack {
                Text("Due date")
                    .font(.headline)
                    .foregroundColor(.black)
                
                DatePicker(
                    "",
                    selection: $viewModel.selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .foregroundStyle(.black)
                
                Button("OK") {
                    showDatePicker = false
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
