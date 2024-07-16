//
//  ListScreenViewModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import FirebaseFirestore
import Foundation

final class ListScreenViewModel: ObservableObject {
	private let userID: String
	private var listener: ListenerRegistration?
	@Published var todoList: [ToDoModel]
	
	init(userID: String) {
		self.userID = userID
		todoList = []
		fetchTasks(userID: userID)
	}
	
	func fetchTasks(userID: String) {
		listener = Firestore.firestore().collection("users")
			.document(userID)
			.collection("todos")
			.addSnapshotListener { [weak self] querySnapshot, error in
				guard let documents = querySnapshot?.documents else {
					print("No documents")
					return
				}
				
				self?.todoList = documents.compactMap { queryDocumentSnapshot in
					let data = queryDocumentSnapshot.data()
//					return ToDoModel(dictionary: queryDocumentSnapshot.data())
				}
			}
	}
	
	static func createModule(for userID: String) -> ListScreen {
		let viewModel = Self.init(userID: userID)
		
		return ListScreen(userID: userID, viewModel: viewModel)
	}
	
	func deleteItem(with id: UUID) {
		FirestoreService.shared.deleteTask(with: id.uuidString, userID: userID)
	}
}
