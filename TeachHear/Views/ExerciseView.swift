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
				if isNew {
					VStack(alignment: .leading) {
						Text("Exercise Type")
							.font(.title2.weight(.semibold))
							.padding(.leading, 32)
						
						ScrollView(.horizontal) {
							HStack {
								ForEach(ExerciseType.allCases, id: \.self) { exerciseType in
									ExerciseTypeButton(exerciseType, selected: $selectedExerciseType)
								}
							}
							.padding(.horizontal)
						}
					}
					.padding(.vertical)
					.background(Color(uiColor: .systemGroupedBackground))
					.cornerRadius(30)
				}
				
				VStack(alignment: .leading) {
					if isNew {
						Text(selectedExerciseType.instructions)
							.font(.title2.weight(.semibold))
							.padding(.leading, 32)
							.offset(y: 16)
					}
					
					LyricsView(lyrics, exerciseType: $selectedExerciseType)
				}
				.frame(width: UIScreen.main.bounds.width * 2 / 3)
				.background(Color(uiColor: .systemGroupedBackground))
				.cornerRadius(30)
				
				// TODO: Add done button
			}
			.frame(width: UIScreen.main.bounds.width * 2 / 3)
			
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
