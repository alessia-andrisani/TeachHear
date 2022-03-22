//
//  SearchResults.swift
//  TeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import SwiftUI

struct SearchResults: View {
	@EnvironmentObject private var searchManager: SearchManager
	
	var body: some View {
		if let results = searchManager.results {
			List(results, id: \.id) { song in
				NavigationLink(song.title) {
					ExerciseView(EditableExercise(song))
				}
			}
			.listStyle(.plain)
			.cornerRadius(10)
			.padding(.horizontal, 20)
			.frame(height: UIScreen.main.bounds.height / 4)
			.shadow(radius: 3, y: 1)
		}
	}
}
