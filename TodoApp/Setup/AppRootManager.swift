//
//  AppRootManager.swift
//  TodoApp
//
//  Created by Devansh Mohata on 09/07/24.
//

import FirebaseAuth

enum AppState {
	case splash
	case authentication
	case home
}

final class AppRootManager: ObservableObject {
	@Published var appState: AppState = .splash
	
	func checkLogInStatus() {
		appState = Auth.auth().currentUser != nil ? .home : .authentication
	}
}
