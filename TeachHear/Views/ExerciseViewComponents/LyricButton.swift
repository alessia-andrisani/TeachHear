//
//  LyricButton.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

struct LyricButton: View {
	init(_ title: String, isHighlighted: Binding<Bool>) {
		self.title = title
		_isHighlighted = isHighlighted
	}
	
	let title: String
	
	@Binding private var isHighlighted: Bool
	
	var body: some View {
		Button(title) {
			isHighlighted.toggle()
		}
		.font(.largeTitle.bold())
		.frame(height: 44)
		.foregroundColor(isHighlighted ? .indigo : .primary)
	}
}

struct LyricButton_Previews: PreviewProvider {
    static var previews: some View {
		LyricButton("", isHighlighted: .constant(false))
    }
}
