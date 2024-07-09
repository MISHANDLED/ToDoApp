//
//  RegistrationScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import SwiftUI

struct RegistrationScreen: View {
	@StateObject var viewModel: RegistrationScreenViewModel = .init()
	
	var body: some View {
		VStack {
			OnboardingHeaderView(title: "Register Here",
							subtitle: "Don't Depend on Tomorrow",
							backgroundColor: .orange)
				.frame(height: 260)
				.offset(y: -100)
			
			VStack(spacing: 24) {
				TextField("Full Name", text: $viewModel.name)
					.textFieldStyle(.roundedBorder)
					.autocorrectionDisabled()
					.textInputAutocapitalization(.words)
				
				TextField("Email Address", text: $viewModel.email)
					.textFieldStyle(.roundedBorder)
					.autocorrectionDisabled()
					.textInputAutocapitalization(.never)
				
				SecureField("Password", text: $viewModel.password)
					.textFieldStyle(.roundedBorder)
				
				OnboardingButton(title: "Sign Up", background: .blue) {
					viewModel.register()
				}
				.frame(height: 36)
			}
			.padding()
			.toolbar {
				ToolbarItem(placement: .keyboard) {
					HStack {
						Spacer()
						Button("Done") {
							UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
						}
					}
				}
			}
			
			Spacer(minLength: 100)
		}
	}
}

#Preview {
	RegistrationScreen()
}
