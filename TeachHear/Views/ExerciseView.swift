//
//  ExerciseView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct ExerciseView: View {
	init(isNew: Bool = false) {
		self.isNew = isNew
	}
	
	let isNew: Bool
	
	@State var selectedExerciseType = ExerciseType.wordScramble
	
	var body: some View {
		HStack {
			Spacer()
			
			
			
			VStack(spacing: 16) {
				if selectedExerciseType != .fillTheGap {
				Text("Select the \(selectedExerciseType == ExerciseType.sentenceScramble ? "sentences" : "words") you want to scramble")
				} else {
					Text("Select the words you want to remove")
				}
				
				if isNew {
					VStack(alignment: .leading) {
						Text("Exercise type")
							.font(.title2.weight(.semibold))
							.padding(.leading)
							.padding(.leading)
						
						ScrollView(.horizontal) {
							HStack {
								ForEach(ExerciseType.allCases, id: \.self) { exerciseType in
									Button {
										selectedExerciseType = exerciseType
									} label: {
										ExerciseButton(exerciseType: exerciseType,
													   selectedExerciseType: $selectedExerciseType)
									}
								}
							}
							.padding(.horizontal)
						}
					}
					.padding(.vertical)
					.background(Color(uiColor: .systemGroupedBackground))
					.cornerRadius(30)
				}
				
				LyricsView(lyrics, exerciseType: $selectedExerciseType)
					.frame(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
				
				// TODO: Add done button
			}
			.frame(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
			
			Spacer()
		}
		.background(Color.indigo.opacity(0.35))
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("New Exercise")
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseView()
.previewInterfaceOrientation(.landscapeLeft)
	}
}
