//
//  LyricsView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

struct LyricsView: View {
	@EnvironmentObject private var exercise: EditableExercise
	
	@State private var previousType: ExerciseType?
	
	var body: some View {
		VStack(alignment: .leading) {
			ForEach(exercise.words.indices, id: \.self) { lineIndex in
				HStack(spacing: .zero) {
					ForEach(exercise.words[lineIndex].indices, id: \.self) { wordIndex in
						let word = exercise.words[lineIndex][wordIndex]
						
						if word == "\u{200b}" {
							Spacer()
								.frame(height: 10)
						} else {
							Button(word + " ") {
								toggleWord(lineIndex, wordIndex)
							}
							.buttonStyle(.lyrics(isHighlighted: isWordModified(lineIndex, wordIndex)))
							.lineLimit(1)
							.disabled(!exercise.isNew)
						}
					}
				}
			}
		}
		.padding(20)
		.onChange(of: exercise.type) { newType in
			if newType == .sentenceScramble || previousType == .sentenceScramble {
				exercise.words = exercise.originalWords
			} else {
				for lineIndex in exercise.words.indices {
					for wordIndex in exercise.words[lineIndex].indices where isWordModified(lineIndex, wordIndex) {
						modifyWord(lineIndex, wordIndex)
					}
				}
			}
			
			previousType = newType
		}
	}
	
	private func toggleWord(_ lineIndex: Int, _ wordIndex: Int) {
		if isWordModified(lineIndex, wordIndex) {
			resetWord(lineIndex, wordIndex)
		} else {
			modifyWord(lineIndex, wordIndex)
		}
	}
	
	private func modifyWord(_ lineIndex: Int, _ wordIndex: Int) {
		switch exercise.type {
			case .wordScramble:
				exercise.words[lineIndex][wordIndex] = exercise.originalWords[lineIndex][wordIndex].wordScrambled()
			case .fillTheGap:
				exercise.words[lineIndex][wordIndex] = exercise.originalWords[lineIndex][wordIndex].fillTheGapped()
			case .sentenceScramble:
				exercise.words[lineIndex] = exercise.originalWords[lineIndex].sentenceScrambled()
		}
	}
	
	private func isWordModified(_ lineIndex: Int, _ wordIndex: Int) -> Bool {
		if exercise.type == .sentenceScramble {
			return exercise.words[lineIndex] != exercise.originalWords[lineIndex]
		} else {
			return exercise.words[lineIndex][wordIndex] != exercise.originalWords[lineIndex][wordIndex]
		}
	}
	
	private func resetWord(_ lineIndex: Int, _ wordIndex: Int) {
		if exercise.type == .sentenceScramble {
			exercise.words[lineIndex] = exercise.originalWords[lineIndex]
		} else {
			exercise.words[lineIndex][wordIndex] = exercise.originalWords[lineIndex][wordIndex]
		}
	}
}

struct LyricsView_Previews: PreviewProvider {
	static var previews: some View {
		LyricsView()
			.environmentObject(EditableExercise.exampleExercise)
			.previewDevice("iPad Pro (11-inch) (3rd generation)")
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
