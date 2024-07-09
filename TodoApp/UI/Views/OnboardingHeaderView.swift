//
//  OnboardingHeaderView.swift
//  TodoApp
//
//  Created by Devansh Mohata on 07/07/24.
//

import SwiftUI

struct OnboardingHeaderView: View {
	let title: String
	let subtitle: String
	let backgroundColor: Color
	
	init(title: String, subtitle: String, backgroundColor: Color = .pink) {
		self.title = title
		self.subtitle = subtitle
		self.backgroundColor = backgroundColor
	}
	
	var body: some View {
		ZStack() {
			RoundedRectangle(cornerRadius: 25, style: .circular)
				.foregroundStyle(backgroundColor)
			
			VStack {
				Text(title)
					.font(.largeTitle.weight(.black))
					.foregroundStyle(.white)
				
				Text(subtitle)
					.font(.title2.weight(.heavy))
					.foregroundStyle(.white)
			}
			.padding(.bottom, -60)
		}
	}
}

#Preview {
	OnboardingHeaderView(title: "TODO APP", subtitle: "Don't Depend on Tomorrow")
}
