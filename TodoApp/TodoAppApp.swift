//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import SwiftUI
import SwiftData

@main
struct TodoAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
