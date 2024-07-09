//
//  OnboardingButton.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import SwiftUI

struct OnboardingButton: View {
	let title: String
	let background: Color
	let action: (() -> Void)?
	
	init(title: String, background: Color, action: (() -> Void)?) {
		self.title = title
		self.background = background
		self.action = action
	}
	
	var body: some View {
		Button(action: {
			action?()
		}, label: {
			ZStack {
				RoundedRectangle(cornerRadius: 8)
					.foregroundStyle(background)
				
				Text(title)
					.font(.body)
					.bold()
					.foregroundStyle(.white)
			}
		})
	}
}

#Preview {
	OnboardingButton(title: "Button", background: .accentColor) {
		print("Action")
	}
}
