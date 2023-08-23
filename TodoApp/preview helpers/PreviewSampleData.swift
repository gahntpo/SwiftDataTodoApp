//
//  PreviewSampleData.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Todo.self,
                                           configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            let context = container.mainContext
            
            let todo = Todo.example()
            context.insert(todo)
            
            let doneTodo = Todo(name: "Go to the dentist", isDone: true)
            context.insert(doneTodo)
            
        }
        return container
    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()
