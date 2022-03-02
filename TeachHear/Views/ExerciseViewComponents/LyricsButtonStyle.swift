//
//  LyricsButtonStyle.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

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
