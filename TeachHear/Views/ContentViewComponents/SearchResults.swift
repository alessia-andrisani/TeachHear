//
//  SearchResults.swift
//  TeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import SwiftUI

struct SearchResults: View {
	let results: [SongResult]
	
	var body: some View {
		List(results, id: \.id) { song in
			NavigationLink(song.title) {
				ExerciseView(EditableExercise(song))
			}
			.listSectionSeparator(.hidden)
		}
		.listStyle(.plain)
		.cornerRadius(10)
		.padding(.horizontal, 50)
		.frame(height: UIScreen.main.bounds.height / 4)
		.shadow(radius: 3, y: 1)
	}
}
