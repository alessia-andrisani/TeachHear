//
//  LyricButton.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

struct LyricButton: View {
	init(_ word: String, originalWord: String, action: @escaping () -> Void) {
		self.word = word + " "
		self.action = action
		
		_isHighlighted = .init(initialValue: word != originalWord)
	}
	
	@State private var isHighlighted: Bool
	
	private let word: String
	private let action: () -> Void
	
	var body: some View {
		Button(word) {
			isHighlighted.toggle()
			action()
		}
		.font(.largeTitle.bold())
		.frame(height: 44)
		.foregroundColor(isHighlighted ? .indigo : .primary)
	}
}

struct LyricButton_Previews: PreviewProvider {
    static var previews: some View {
		LyricButton("", originalWord: "") { }
    }
}

struct LyricsButtonStyle: ButtonStyle {
	let isHighlighted: Bool
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.font(.largeTitle.bold())
			.frame(minHeight: 44)
			.foregroundColor(isHighlighted ? .indigo : .primary)
	}
}

extension ButtonStyle where Self == LyricsButtonStyle {
	static func lyrics(isHighlighted: Bool) -> LyricsButtonStyle {
		LyricsButtonStyle(isHighlighted: isHighlighted)
	}
}
