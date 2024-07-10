//
//  HomeScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import SwiftUI

struct HomeScreen: View {
	enum TabMode: CustomStringConvertible {
		case home
		case profile
		
		var description: String {
			switch self {
			case .home:
				return "Home"
			case .profile:
				return "Profile"
			}
		}
	}
	
	@State var tabMode: TabMode = .home
	
	var body: some View {
		NavigationView {
			TabView(selection: $tabMode) {
				ListScreen()
					.tabItem {
						Label("Home", systemImage: "house.fill")
					}
					.tag(TabMode.home)
				
				
				ProfileScreen()
					.tabItem {
						Label("Profile", systemImage: "person.fill")
					}
					.tag(TabMode.profile)
			}
			.navigationTitle(tabMode.description)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				createBuilder()
			}
		}
	}
	
	@ViewBuilder
	func createBuilder() -> some View {
		switch tabMode {
		case .home:
			NavigationLink(destination: NewItemScreenViewModel.createModule()) { 
				Image(systemName: "plus")
			}
			
		case .profile:
			NavigationLink(destination: NewItemScreenViewModel.createModule()) {
				Image(systemName: "plus")
			}
		}
	}
}

#Preview {
	HomeScreen()
}
