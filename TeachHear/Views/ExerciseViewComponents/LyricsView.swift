//
//  LyricsView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI



struct LyricsView: View {
	init(_ lyrics: String, exerciseType: Binding<ExerciseType>) {
		let lyricsWithSections = lyrics.replacingOccurrences(of: "\n\n", with: "\n\u{200b}\n")  // Inserts a invisible character to keep the sections of the text
		let lines = lyricsWithSections.split(separator: "\n")
		let words = lines.map { $0.split(separator: " ") }
		
		_exerciseType = exerciseType
		_previousType = .init(initialValue: exerciseType.wrappedValue)
		
		_states = .init(initialValue: lines.indices
							.map { words[$0] }
							.map { line in line.map { _ in return false } })
		
		self.words = words
	}
	
	@Binding private var exerciseType: ExerciseType
	
	@State private var previousType: ExerciseType
	@State private var states: [[Bool]]
	
	private let words: [[Substring.SubSequence]]
	
	var body: some View {
		VStack(alignment: .leading) {
			let range = 0..<(words.count)
			
			ForEach(range, id: \.self) { lineIndex in
				HStack(spacing: .zero) {
					let indices = exerciseType == .sentenceScramble && states[lineIndex][0] ? words[lineIndex].indices.shuffled() : Array(words[lineIndex].indices)
					
					ForEach(indices, id: \.self) { wordIndex in
						let word = String(words[lineIndex][wordIndex])
						
						if word == "\u{200b}" {
							Spacer()
								.frame(height: 10)
						} else {
							let word: String = {
								if states[lineIndex][wordIndex] == true {
									switch exerciseType {
										case .wordScramble: return word.wordScramble()
										case .fillTheGap: return word.fillTheGap()
										case .sentenceScramble: return word.lowercased()
									}
								} else {
									return word
								}
							}() + " "
							
							let selectionIndex = exerciseType == .sentenceScramble ? 0 : wordIndex
							
							LyricButton(word, isHighlighted: $states[lineIndex][selectionIndex])
						}
					}
				}
			}
		}
		.padding(20)
		.onChange(of: exerciseType) { newType in
			if newType == .sentenceScramble || previousType == .sentenceScramble {
				for index in states.indices {
					states[index] = states[index].map { _ in return false }
				}
			}
			
			previousType = newType
		}
	}
}

struct LyricsView_Previews: PreviewProvider {
	static var previews: some View {
        LyricsView(.exampleLyrics, exerciseType: .constant(.wordScramble))
			.previewDevice("iPad Pro (11-inch) (3rd generation)")
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
