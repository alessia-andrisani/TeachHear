//
//  LyricsView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

struct LyricsView: View {
	init(exercise: ObservedObject<EditableExercise>) {
		_exercise = exercise
		
		_previousType = .init(initialValue: exercise.wrappedValue.type)
	}
	
	@ObservedObject private var exercise: EditableExercise
	
	@State private var previousType: ExerciseType
	
	var body: some View {
		VStack(alignment: .leading) {
			let lines = 0..<(exercise.originalWords.count)
			
			ForEach(lines, id: \.self) { lineIndex in
				HStack(spacing: .zero) {
					ForEach(exercise.words[lineIndex].indices, id: \.self) { wordIndex in
						let word = exercise.words[lineIndex][wordIndex]
						
						if word == "\u{200b}" {
							Spacer()
								.frame(height: 10)
						} else {
							Button(word + " ") {
								scramble(lineIndex, wordIndex)
							}
							.buttonStyle(.lyrics(isHighlighted: isWordChanged(lineIndex, wordIndex)))
							.disabled(!exercise.isNew)  // TODO: The highlighting does not appear with !isNew
						}
					}
				}
			}
			.disabled(!exercise.isNew)
		}
		.padding(20)
		.onChange(of: exercise.type) { newType in
//			if newType == .sentenceScramble || previousType == .sentenceScramble {
				exercise.words = exercise.originalWords
//			}
			
			previousType = newType
		}
	}
	
	private func scramble(_ lineIndex: Int, _ wordIndex: Int) {
		if isWordChanged(lineIndex, wordIndex) {
			resetWord(lineIndex, wordIndex)
		} else {
			switch exercise.type {
				case .wordScramble: exercise.words[lineIndex][wordIndex].wordScrambled()
				case .fillTheGap: exercise.words[lineIndex][wordIndex].fillTheGapped()
				case .sentenceScramble: exercise.words[lineIndex].sentenceScrambled()
			}
		}
	}
	
	private func isWordChanged(_ lineIndex: Int, _ wordIndex: Int) -> Bool {
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
		LyricsView(exercise: .init(initialValue: .exampleExercise))
			.previewDevice("iPad Pro (11-inch) (3rd generation)")
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
