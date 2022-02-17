//
//  RecentsView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct RecentsView: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Recents")
				.fontWeight(.bold)
				.font(.system(size: 25))
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 50) {
					ForEach(0..<10) { _ in
						NavigationLink(destination: ExerciseView()) {
							HStack {
								ZStack(alignment: .leading) {
									RoundedRectangle(cornerRadius: 13)
										.strokeBorder(lineWidth: 0.1)
										.foregroundColor(.secondary)
										.frame(width: 360, height: 160)
										.background(Color(uiColor: .systemGray6))
										.mask(RoundedRectangle(cornerRadius: 7))
										.shadow(color: Color(uiColor: .systemGray5), radius: 5, x: 2, y: 5)
									HStack {
										RoundedRectangle(cornerRadius: 10)
											.foregroundColor(.indigo)
											.frame(width: 120, height: 120)
											.padding()
										VStack {
											Text("Save Your Tears")
												.fontWeight(.semibold)
												.font(.system(size: 20))
											Text("Sentence Scramble")
												.font(.system(size: 17))
										}
									}
								}
							}
							.padding(.trailing)
						}
					}
				}
			}
			
		}
		.padding()
	}
}

struct RecentsView_Previews: PreviewProvider {
	static var previews: some View {
		RecentsView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
