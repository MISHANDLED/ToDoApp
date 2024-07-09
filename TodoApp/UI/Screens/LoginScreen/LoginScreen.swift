//
//  LoginScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import SwiftUI

struct LoginScreen: View {
	@StateObject var viewModel: LoginScreenViewModel = .init()
	@FocusState private var emailFocused: Bool
	@FocusState private var passwordFocused: Bool
	
	var body: some View {
		GeometryReader { geometry in
			ScrollView {
				VStack(spacing: 0) {
					OnboardingHeaderView(title: "TODO APP", subtitle: "Start organizing Self!")
						.frame(height: geometry.size.height * 0.3)
						.background(Color.red)
					
					VStack(spacing: 20) {
						if !viewModel.errorMessage.isEmpty {
							Text(viewModel.errorMessage)
								.foregroundStyle(.red)
								.font(.subheadline)
								.frame(maxWidth: .infinity, alignment: .leading)
						}
						
						TextField("Email Address", text: $viewModel.email)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.autocorrectionDisabled()
							.textInputAutocapitalization(.never)
						
						SecureField("Password", text: $viewModel.password)
							.textFieldStyle(RoundedBorderTextFieldStyle())
						
						OnboardingButton(title: "Sign In", background: .blue) {
							viewModel.login()
						}
						.frame(height: 36)
						.padding(.horizontal, 40)
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
					
					Spacer(minLength: geometry.size.height * 0.2) // Add some minimum spacing
					
					VStack(alignment: .center, spacing: 8) {
						Text("Don't have an account yet?")
						NavigationLink("Create an Account", destination: RegistrationScreen())
							.foregroundStyle(.blue)
					}
					.padding(.bottom, 24)
				}
				.frame(minHeight: geometry.size.height)
			}
			.edgesIgnoringSafeArea(.top)
		}
		.ignoresSafeArea(.keyboard)
	}
}

#Preview {
	LoginScreen()
}
