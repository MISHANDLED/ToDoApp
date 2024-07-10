//
//  LoginScreenViewModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import FirebaseAuth
import Foundation

final class LoginScreenViewModel: ObservableObject {
	@Published var email: String
	@Published var password: String
	@Published var errorMessage: String
	
	init() {
		self.email = ""
		self.password = ""
		self.errorMessage = ""
	}
	
	func login() {
		errorMessage = ""
		guard validate() else { return }
		
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			
		}
	}
	
	func validate() -> Bool {
		guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
			  email.trimmingCharacters(in: .whitespacesAndNewlines).isValidEmail else {
			errorMessage = "Please enter valid email address"
			return false
		}
		
		guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			errorMessage = "Please enter valid password"
			return false
		}
		
		return true
	}
}

extension String {
	var isValidEmail: Bool {
		NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
	}
}
