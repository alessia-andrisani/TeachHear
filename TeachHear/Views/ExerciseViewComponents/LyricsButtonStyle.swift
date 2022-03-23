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
			.font(.largeTitle.weight(.semibold))
			.frame(minHeight: 44)
			.foregroundColor(isHighlighted ? .accentColor : .primary)
			.scaleEffect(configuration.isPressed ? 0.85 : 1)
	}
}

extension ButtonStyle where Self == LyricsButtonStyle {
	static func lyrics(isHighlighted: Bool) -> LyricsButtonStyle {
		LyricsButtonStyle(isHighlighted: isHighlighted)
	}
}
