//
//  ToDoModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import Foundation

struct ToDoModel: Codable, Identifiable {
	let id: UUID
	let title: String
	let description: String
	let createdAt: TimeInterval
	let dueDate: TimeInterval
	let isDone: Bool
	
	init(id: UUID = UUID(), title: String, description: String, createdAt: TimeInterval, dueDate: TimeInterval, isDone: Bool) {
		self.id = id
		self.title = title
		self.description = description
		self.createdAt = createdAt
		self.dueDate = dueDate
		self.isDone = isDone
	}
	
	enum CodingKeys: String, CodingKey {
		case id,
			 title,
			 description
		
		case createdAt = "created_at",
			 dueDate = "due_date",
			 isDone = "is_done"
	}
}
