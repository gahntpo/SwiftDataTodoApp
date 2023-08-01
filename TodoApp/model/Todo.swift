//
//  Item.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import Foundation
import SwiftData

@Model
final class Todo {
    
    @Attribute(.unique)
    var creationDate: Date
    var name: String
    var isDone: Bool
    var priority: Int

    @Attribute(.externalStorage)
    var image: Data?
    
    var tags: [Tag]?
    
    init(name: String, isDone: Bool = false, priority: Int = 0) {
        self.creationDate = Date()
        self.name = name
        self.isDone = isDone
        self.priority = priority
    }
    
    static func example() -> Todo {
        let todo = Todo(name: "Buy milk")
        let tag = Tag(name: "Shopping", color: RGBColor(red: 1, green: 0, blue: 0))
        todo.tags?.append(tag)
        return todo
    }
}


