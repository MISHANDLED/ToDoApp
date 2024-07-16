//
//  TodoApp.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}

@main
struct TodoApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@StateObject private var viewModel: AppRootManager = .init()
	
	var body: some Scene {
		WindowGroup {
			Group {
				switch viewModel.appState {
				case .splash:
					StartUpScreen()
						.transition(.opacity)
				case .authentication:
					LoginScreen()
						.transition(.move(edge: .leading))
				case .home:
					if let userID = Auth.auth().currentUser?.uid {
						HomeScreen(userID: userID)
							.transition(.move(edge: .bottom))
					} else {
						EmptyView()
					}
				}
			}
			.environmentObject(viewModel)
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak viewModel] in
					viewModel?.checkLogInStatus()
				}
			}
		}
	}
}
