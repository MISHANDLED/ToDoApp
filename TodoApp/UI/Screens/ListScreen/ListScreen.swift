//
//  ListScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import FirebaseFirestore
import SwiftUI

struct ListScreen: View {
	@ObservedObject var viewModel: ListScreenViewModel
	private let userID: String
	@FirestoreQuery var items: [ToDoModel]
	
	init(userID: String, viewModel: ListScreenViewModel) {
		self.userID = userID
		self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
		self.viewModel = viewModel
	}
	
	var body: some View {
		List(items) { item in
			ToDoListItem(todoItem: item)
				.swipeActions(edge: .trailing, allowsFullSwipe: false) {
					Button(action: {
						viewModel.deleteItem(with: item.id)
					}) {
						Text("Delete")
					}
					.tint(.red)
				}
		}
	}
}

#Preview {
	ListScreen(
		userID: "FODFQFxjbSO5cyg9SKVuNMjP1Op1",
		viewModel: .init(userID: "FODFQFxjbSO5cyg9SKVuNMjP1Op1")
	)
}
