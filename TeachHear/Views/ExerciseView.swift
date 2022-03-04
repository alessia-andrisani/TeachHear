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
	
	@Environment(\.managedObjectContext) private var moc
	@Environment(\.dismiss) private var dismiss
	
	@StateObject private var exercise: EditableExercise
	
	@State private var showingOptions = false
	
	
	private let shortScreenSide: CGFloat = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
	
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
						saveToRecents()
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
	
	private func saveContext() {
		do {
			try moc.save()
		} catch {
			let error = error as NSError
			fatalError("Unresolver error: \(error)")
		}
	}
	
	private func saveToRecents() {
		let newSong = CoreSong(context: moc)
		newSong.setValues(id: UUID().uuidString,
						  lyrics: exercise.originalLyrics,
						  title: exercise.title)
		
		let newExercise = CoreExercise(context: moc)
		newExercise.setValues(date: .now,
							  id: UUID(),
							  lyrics: exercise.words.toString(),
							  title: exercise.title,
							  song: newSong,
							  type: exercise.type.rawValue)
		
		saveContext()
		
		dismiss()
	}
}

struct ExerciseView_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseView(.exampleExercise)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
