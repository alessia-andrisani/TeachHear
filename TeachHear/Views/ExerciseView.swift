//
//  ExerciseView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct ExerciseView: View {
	init(lyrics: String, isNew: Bool = false) {
		self.lyrics = lyrics
		self.isNew = isNew
	}
	
	private let lyrics: String
	private let isNew: Bool
	
	@State private var selectedExerciseType = ExerciseType.wordScramble
	
	@State private var showingOptions = false
	@EnvironmentObject var exerciseStore: ExerciseStore
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		ScrollView {
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
						.background(Color(uiColor: .secondarySystemGroupedBackground))
						.cornerRadius(30)
						
						.toolbar {
							ToolbarItem {
								Button("Done") {
									showingOptions = true
								}
								.confirmationDialog("Where do you want to save the exercise?", isPresented: $showingOptions, titleVisibility: .hidden) {
									
									Button("Add to recents") {
										let newExercise = Exercise(title: "Present Simple", song: Song(id: "", title: "Bella Ciao", originalLyrics: .exampleLyrics), lyrics: .exampleLyrics, date: Date.now)
										
										exerciseStore.exercises.append(newExercise)
										
										dismiss()
										
										
									}
									
									Button("Create new folder") {
										// TODO: Add action here
									}
									
									Button("Add to existing folder") {
										// TODO: Add action here
									}
	
								}
							}
						}
					}
					
					VStack(alignment: .leading) {
						if isNew {
							Text(selectedExerciseType.instructions)
								.font(.title2.weight(.semibold))
								.padding(.leading, 32)
								.offset(y: 16)
						}
						
						LyricsView(lyrics, exerciseType: $selectedExerciseType)
							.disabled(!isNew)
					}
					.frame(width: UIScreen.main.bounds.width * 2 / 3)
					.background(Color(uiColor: .secondarySystemGroupedBackground))
					.cornerRadius(30)
					.padding(.bottom)
					
				}
				.frame(width: UIScreen.main.bounds.width * 2 / 3)
				
				Spacer()
			}
		}
		.background(Color.indigo.opacity(0.35))
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("New Exercise")
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseView(lyrics: .exampleLyrics)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
