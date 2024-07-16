//
//  FirestoreService.swift
//  TodoApp
//
//  Created by Devansh Mohata on 16/07/24.
//

import FirebaseFirestore
import Foundation

final class FirestoreService {
	static let shared: FirestoreService = FirestoreService()
	
	private let db: Firestore
	private let userCollection: String
	private let todosCollection: String
	
	private init() {
		db = Firestore.firestore()
		userCollection = "users"
		todosCollection = "todos"
	}
	
	func deleteTask(with id: String, userID: String) {
		db.collection(userCollection)
			.document(userID)
			.collection(todosCollection)
			.document(id)
			.delete()
	}
	
	func addTask(userID: String, task: ToDoModel) async throws {
		do {
			try await db.collection(userCollection)
				.document(userID)
				.collection(todosCollection)
				.document(task.id.uuidString)
				.setData(task.asDictionary())
		} catch {
			throw error
		}
	}
}
