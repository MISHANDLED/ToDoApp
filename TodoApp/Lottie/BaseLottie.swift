//
//  BaseLottie.swift
//  TodoApp
//
//  Created by Devansh Mohata on 09/07/24.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
	
	var animationFileName: String
	let loopMode: LottieLoopMode
	let contentMode: UIView.ContentMode
	
	init(animationFileName: String, loopMode: LottieLoopMode, contentMode: UIView.ContentMode = .scaleAspectFit) {
		self.animationFileName = animationFileName
		self.loopMode = loopMode
		self.contentMode = contentMode
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
	
	func makeUIView(context: Context) -> Lottie.LottieAnimationView {
		let animationView = LottieAnimationView(name: animationFileName)
		animationView.loopMode = loopMode
		animationView.play()
		animationView.contentMode = contentMode
		return animationView
	}
}
