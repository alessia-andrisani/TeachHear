//
//  Exercise.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//

import Foundation

struct Exercise: Identifiable {
	var id = UUID()
	var title: String
	var song: Song
	var lyrics: String
	var date: Date
	
	static var exampleExercise = Exercise(title: "Bella Ciao",
										  song: Song(id: "",
													 title: "Bella Ciao",
													 originalLyrics: .exampleLyrics),
										  lyrics: .exampleLyrics,
										  date: .now)
}

struct Song: Identifiable {
	var id: String
	var title: String
	var originalLyrics: String
}
