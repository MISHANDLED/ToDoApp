//
//  StartUpScreen.swift
//  TodoApp
//
//  Created by Devansh Mohata on 09/07/24.
//

import SwiftUI

struct StartUpScreen: View {
	var body: some View {
		VStack {
			LottieView(animationFileName: "cat", loopMode: .loop)
			
			Text("Loading")
				.font(.title.weight(.black))
				.foregroundStyle(.blue)
		}
		.onAppear {
		}
    }
}

#Preview {
    StartUpScreen()
}
