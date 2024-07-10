//
//  NewItemScreenViewModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class NewItemScreenViewModel: ObservableObject {
	@Published var title: String
	@Published var description: String
	@Published var dueDate: Date
	@Published var showError: Bool
	
	
	init() {
		self.title = ""
		self.description = ""
		self.dueDate = Date()
		showError = false
	}
	
	static func createModule() -> NewItemScreen {
		let viewModel = Self.init()
		return NewItemScreen(viewModel: viewModel)
	}
	
	func onSave() {
		let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard validate(title: trimmedTitle, date: dueDate) else {
			showError = true
			return
		}
		
		guard let userID = Auth.auth().currentUser?.uid else {
			// TODO: Error Screen
			return
		}
		
		let taskID = UUID()
		
		let model = ToDoModel.init(
			id: taskID,
			title: title,
			description: description,
			createdAt: Date().timeIntervalSince1970,
			dueDate: dueDate.timeIntervalSince1970,
			isDone: false
		)
		
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(userID)
			.collection("todos")
			.document(taskID.uuidString)
			.setData(model.asDictionary()) { err in
				if let err {
					print(err.localizedDescription)
				}
			}
	}
	
	func toggleSave() {
		showError.toggle()
	}
	
	private func validate(title: String, date: Date) -> Bool {
		guard !title.isEmpty else {
			return false
		}
		
		guard date > Date() else {
			return false
		}
		
		return true
	}
}
