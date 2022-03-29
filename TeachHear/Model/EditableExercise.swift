//
//  EditableExercise.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 02/03/22.
//

import Foundation

class EditableExercise: ObservableObject {
	convenience init(_ song: SongResult) {
		let cleanTitle: String = {
			if let firstBraceIndex = song.title.firstIndex(of: "(") ?? song.title.firstIndex(of: "[") {
				let range = song.title.startIndex..<firstBraceIndex
				return String(song.title[range])
			} else {
				return song.title
			}
		}()
		
		self.init(id: song.id.description,
				  date: .now,
				  title: cleanTitle,
				  type: .wordScramble,
				  originalLyrics: song.lyrics)
	}
	
	convenience init(_ exercise: CoreExercise) {
		self.init(id: exercise.wrappedID.uuidString,
				  date: exercise.wrappedDate,
				  title: exercise.wrappedTitle,
				  type: ExerciseType(rawValue: exercise.type ?? "Word Scramble") ?? .wordScramble,
				  lyrics: exercise.wrappedLyrics,
				  originalLyrics: exercise.song?.wrappedLyrics ?? "")
	}
	
	init(id: String,
		 date: Date,
		 title: String,
		 type: ExerciseType,
		 lyrics: String? = nil,
		 originalLyrics: String) {
		self.id = id
		self.date = date
		self.title = title
		self.type = type
		self.isNew = lyrics == nil
		
		func splitIntoArrays(_ text: String) -> [[String]] {
			let textWithSections = text.replacingOccurrences(of: "\n\n", with: "\n\u{200b}\n")  // Inserts a invisible character to keep the sections of the text
			let lines = textWithSections.split(separator: "\n")
			return lines.map { $0.split(separator: " ").map { String($0) } }
		}
		
		self.words = splitIntoArrays(lyrics ?? originalLyrics)
		self.originalLyrics = originalLyrics
		self.originalWords = splitIntoArrays(originalLyrics)
	}
	
	let id: String
	let date: Date
	let isNew: Bool
	let originalLyrics: String
	let originalWords: [[String]]
	
	@Published var title: String
	@Published var type: ExerciseType
	@Published var words: [[String]]
	
	static var exampleExercise = EditableExercise(id: UUID().uuidString,
												  date: .now,
												  title: "Bella Ciao",
												  type: .wordScramble,
												  originalLyrics: .exampleLyrics)
}
