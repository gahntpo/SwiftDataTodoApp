//
//  ContentView.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
   // @Query(sort: \Todo.creationDate, order: .reverse) private var todos: [Todo]

    @Query(sort: [.init(\Todo.name) ,.init(\Todo.creationDate, order: .reverse)], animation: .bouncy)
    private var todos: [Todo]
    
    @Query(filter: #Predicate<Todo>{ !$0.isDone },
           sort: [.init(\Todo.name) ,.init(\Todo.creationDate, order: .reverse)],
           animation: .bouncy)
    private var remainingTodos: [Todo]
    
    
    var body: some View {
        NavigationSplitView {
            List {
                Section("All todos:") {
                    ForEach(todos) { todo in
                        NavigationLink {
                            DetailTodoView(todo: todo)
                        } label: {
                            TodoRow(todo: todo)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            
                Section("Still not done:") {
                    ForEach(remainingTodos) { todo in
                        TodoRow(todo: todo)
                    }
                }
            }
            .navigationTitle("Your Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        let newItem = Todo(name: "new")
        modelContext.insert(newItem)
        
    }
    
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
