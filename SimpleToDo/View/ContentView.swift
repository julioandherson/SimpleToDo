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
                
                VStack {
                    HStack {
                        TextField("Enter new task", text: $viewModel.newTaskTitle,onCommit: {
                            viewModel.addTask()
                        })
                        .padding()
                        
                        Button(action: {
                            showDatePicker.toggle()
                        })
                        {
                            Image(systemName: "calendar.circle.fill")
                                .padding(.leading)
                        }
                        
                        Button(action: viewModel.addButtonTapped) {
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(viewModel.newTaskTitle.isEmpty)
                        .padding()
                        
                    }
                    
                    HStack {
                        Text("Prioridade:")
                        
                        Picker("Prioridade", selection: $viewModel.selectedPriority) {
                            ForEach(Priority.allCases) { priority in
                                Label(priority.rawValue, systemImage: priority.symbol)
                                    .tag(priority)
                            }
                            
                        }
                        .pickerStyle(.menu)
                        .accentColor(viewModel.selectedPriority.color)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)

                    List {
                        ForEach(viewModel.todos) { todo in
                            ToDoItemView(todo: todo, viewModel: viewModel)
                        }
                        .onDelete(perform: viewModel.deleteTask)
                    }
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
