//
//  EditableExercise.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 02/03/22.
//

import Foundation

class EditableExercise: ObservableObject {
	convenience init(_ exercise: CoreExercise,
					 type: ExerciseType = .wordScramble) {  // TODO: Add type to CoreExercise
		self.init(id: exercise.wrappedID,
				  date: exercise.wrappedDate,
				  title: exercise.wrappedTitle,
				  type: type,
//				  song: exercise.song!,
				  lyrics: exercise.wrappedLyrics,
				  originalLyrics: exercise.song?.wrappedLyrics ?? "",
				  isNew: false)
	}
	
	convenience init(_ exercise: Exercise,
					 type: ExerciseType = .wordScramble,
					 isNew: Bool = true) {  // TODO: Should be eplaced with CoreData object later
		self.init(id: exercise.id,
				  date: exercise.date,
				  title: exercise.title,
				  type: type,
//				  song: exercise.song,
				  lyrics: exercise.lyrics,
				  originalLyrics: exercise.song.originalLyrics,
				  isNew: isNew)
	}
	
	init(id: UUID,
		 date: Date,
		 title: String,
		 type: ExerciseType,
//		 song: CoreSong,
		 lyrics: String,
		 originalLyrics: String,
		 isNew: Bool) {
		self.id = id
		self.date = date
		self.title = title
//		self.song = song
		self.type = type
		self.isNew = isNew
		
		func splitIntoArrays(_ text: String) -> [[String]] {
			let lyricsWithSections = lyrics.replacingOccurrences(of: "\n\n", with: "\n\u{200b}\n")  // Inserts a invisible character to keep the sections of the text
			let lines = lyricsWithSections.split(separator: "\n")
			return lines.map { $0.split(separator: " ").map { String($0) } }
		}
		
		self.words = splitIntoArrays(lyrics)
		self.originalWords = splitIntoArrays(originalLyrics)
	}
	
	let originalWords: [[String]]
	
	@Published var id: UUID
	@Published var date: Date
	@Published var title: String
	@Published var type: ExerciseType
//	@Published var song: CoreSong
	@Published var words: [[String]]
	@Published var isNew: Bool
	
	static var exampleExercise = EditableExercise(id: UUID(),
												  date: .now,
												  title: "Bella Ciao",
												  type: .wordScramble,
//												  song: CoreSong(),
												  lyrics: .exampleLyrics,
												  originalLyrics: .exampleLyrics,
												  isNew: true)
}