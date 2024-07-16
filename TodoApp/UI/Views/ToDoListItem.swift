//
//  ToDoListItem.swift
//  TodoApp
//
//  Created by Devansh Mohata on 15/07/24.
//

import SwiftUI

struct ToDoListItem: View {
	var todoItem: ToDoModel
	
	init(todoItem: ToDoModel) {
		self.todoItem = todoItem
	}
	
    var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 8) {
				Text(todoItem.title)
					.font(.headline)
				
				Text(todoItem.description)
					.lineLimit(2)
					.font(.subheadline)
				
				Text("\(Date(timeIntervalSince1970: todoItem.dueDate).formatted(date: .numeric, time: .omitted))")
					.font(.caption)
			}
			
			Spacer()
			
			Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
				Image(systemName: todoItem.isDone ? "checkmark.circle.fill" : "circle")
			})
			
		}
    }
}

#Preview {
	ToDoListItem(
		todoItem: .init(
			title: "Dummy Item",
			description: "Dummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy DescDummy Desc",
			createdAt: Date().timeIntervalSince1970,
			dueDate: Date().timeIntervalSince1970,
			isDone: false
		)
	)
}
