//
//  DetailTodoView.swift
//  TodoApp
//
//  Created by Karin Prater on 01.08.23.
//

import SwiftUI

struct DetailTodoView: View {
    
    @Bindable var todo: Todo
    
    var body: some View {
        VStack {
            TextField("new todo", text: $todo.name)
                .textFieldStyle(.roundedBorder)
            
            Toggle(todo.isDone ? "Done" : "Open", isOn: $todo.isDone)
            
            
            HStack {
                Text("Tags:")
                
                ForEach(todo.tags?.sorted(by: { $0.name < $1.name }) ?? []) { tag in
                    Text(tag.name)
                        .padding(5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(tag.color.toSwiftUIColor(), lineWidth: 2)
                        }
                        .onTapGesture {
                            if let index = todo.tags?.firstIndex(where: { $0 == tag }) {
                                todo.tags?.remove(at: index)
                            }
                        }
                    
                }
            }
            
            Button {
                let tag = Tag(name: "dummy tag", color: RGBColor(red: 1, green: 0, blue: 0, alpha: 1))
                todo.tags?.append(tag)
                
            } label: {
                Text("add tag")
            }

            
        }
        .padding()
    }
}

/*
#Preview {
    DetailTodoView(todo: Todo(name: "new"))
}
*/
