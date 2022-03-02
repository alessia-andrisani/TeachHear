//
//  ExerciseView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct ExerciseView: View {
	init(_ exercise: EditableExercise) {
		_exercise = .init(wrappedValue: exercise)
	}
	
	@Environment(\.dismiss) private var dismiss
	
	@EnvironmentObject private var exerciseStore: ExerciseStore
	
	@ObservedObject private var exercise: EditableExercise
	
	@State private var showingOptions = false
	
	var body: some View {
		ScrollView {
			HStack {
				Spacer()
				
				VStack(spacing: 16) {
					if exercise.isNew {
						VStack(alignment: .leading) {
							Text("Exercise Type:")
								.font(.title2.weight(.semibold))
								.padding(.leading, 32)
							
							ScrollView(.horizontal) {
								HStack {
									ForEach(ExerciseType.allCases, id: \.self) { exerciseType in
										ExerciseTypeButton(exerciseType, selected: $exercise.type)
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
									if exercise.isNew {
										showingOptions = true
									} else {
										dismiss()
									}
								}
								.confirmationDialog("Where do you want to save the exercise?",
													isPresented: $showingOptions,
													titleVisibility: .hidden) {
									Button("Add to recents") {
										let song = Song(id: "",
														title: "Bella Ciao",
														originalLyrics: exercise.originalWords.toString())
										let newExercise = Exercise(title: exercise.title,
																   song: song,
																   lyrics: exercise.words.toString(),
																   date: Date.now)
										
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
						if exercise.isNew {
							Text(exercise.type.instructions)
								.font(.title2.weight(.semibold))
								.padding(.leading, 32)
								.offset(y: 16)
						}
						
						LyricsView(exercise: ObservedObject<EditableExercise>(initialValue: exercise))
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
		.navigationTitle("New Exercise")  // TODO: Should not be "New" if !isNew
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseView(.exampleExercise)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
