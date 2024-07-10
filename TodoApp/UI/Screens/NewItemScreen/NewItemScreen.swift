//
//  NewItemScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import SwiftUI

struct NewItemScreen: View {
	@ObservedObject var viewModel: NewItemScreenViewModel
	
	init(viewModel: NewItemScreenViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		GeometryReader { reader in
			VStack {
				Form {
					TextField("Title", text: $viewModel.title)
					
					TextEditorWithPlaceholder(text: $viewModel.description, placeholder: "Description")
						.frame(height: reader.size.width * 0.3)
					
					DatePicker("Due Date", selection: $viewModel.dueDate, in: Date()...)
						.datePickerStyle(.graphical)
				}
			}
		}
		.navigationTitle("New Item")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button(action: {
				viewModel.onSave()
			}, label: {
				Text("Save")
			})
		}
		.alert("Error", isPresented: $viewModel.showError) {
			Button("OK") { 
				viewModel.toggleSave()
			}
		} message: {
			Text("Please enter all the details properly!")
		}
    }
}

#Preview {
	NavigationView {
		NewItemScreenViewModel.createModule()
	}
}
