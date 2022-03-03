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
	
	@StateObject private var exercise: EditableExercise
	
	@State private var showingOptions = false
	
	private let shortScreenSide: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
	
	private var exerciseTypePicker: some View {
		VStack(alignment: .leading) {
			Text("Exercise Type:")
				.font(.title2.weight(.semibold))
				.padding(.leading, 32)
			
			ScrollView(.horizontal, showsIndicators: false) {
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
	}
	
	var body: some View {
		ScrollView {
			HStack {
				Spacer()
				
				VStack {
					if exercise.isNew {
						exerciseTypePicker
					}
					
					VStack(alignment: .leading) {
						if exercise.isNew {
							Text(exercise.type.instructions)
								.font(.title2.weight(.semibold))
								.padding(.leading, 32)
								.offset(y: 16)
						}
						
						LyricsView()
							.environmentObject(exercise)
					}
					.background(Color(uiColor: .secondarySystemGroupedBackground))
					.cornerRadius(30)
				}
				.padding([.horizontal, .bottom])
				.frame(width: shortScreenSide)
				
				Spacer()
			}
		}
		.background(Color.indigo.opacity(0.35))
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle(exercise.isNew ? String(localized: "New Exercise") : exercise.title)
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
										title: "",
										originalLyrics: exercise.originalLyrics)
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
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseView(.exampleExercise)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
