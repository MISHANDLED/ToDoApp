//
//  ListScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import SwiftUI

struct ListScreen: View {
	@StateObject var viewModel: ListScreenViewModel = .init()
	
    var body: some View {
		Text("ListScreen")
    }
}

#Preview {
    ListScreen()
}
