//
//  TextEditorWithPlaceholder.swift
//  TodoApp
//
//  Created by Devansh Mohata on 10/07/24.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
	@Binding var text: String
	private let placeholder: String
	
	init(text: Binding<String>, placeholder: String) {
		self._text = text
		self.placeholder = placeholder
	}
	
	var body: some View {
		ZStack(alignment: .leading) {
			if text.isEmpty {
				VStack {
					Text(placeholder)
						.padding(.top, 10)
						.padding(.leading, 6)
						.foregroundStyle(.gray)
						.opacity(0.75)
					
					Spacer()
				}
			}
			
			TextEditor(text: $text)
				.opacity(text.isEmpty ? 0.75 : 1)
		}
	}
}
