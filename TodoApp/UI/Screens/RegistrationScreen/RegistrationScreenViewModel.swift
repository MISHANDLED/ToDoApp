//
//  RegistrationScreenViewModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 08/07/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class RegistrationScreenViewModel: ObservableObject {
	@Published var name: String = ""
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage: String = ""
	
	func register() {
		register(
			with: name.trimmingCharacters(in: .whitespacesAndNewlines),
			email: email.trimmingCharacters(in: .whitespacesAndNewlines),
			password: password.trimmingCharacters(in: .whitespacesAndNewlines)
		)
	}
	
	private func register(with name: String, email: String, password: String) {
		guard validate(name: name, email: email, password: password) else { return }
		
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
			guard let user else {
				print(error?.localizedDescription ?? "Something went wrong!")
				return
			}
			
			self?.insertUser(with: user.user.uid, name: name, email: email)
		}
	}
	
	private func insertUser(with id: String, name: String, email: String) {
		let user = User(id: id, name: name, email: email, createdAt: Date().timeIntervalSince1970)
		
		Firestore.firestore()
			.collection("users")
			.document(id)
			.setData(user.asDictionary())
	}
	
	private func validate(name: String, email: String, password: String) -> Bool {
		guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			errorMessage = "Name can't be empty"
			return false
		}
		
		guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
			  email.isValidEmail else {
			errorMessage = "Enter a valid email"
			return false
		}
		
		guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			errorMessage = "Enter a valid password"
			return false
		}
		
		return true
	}
}
