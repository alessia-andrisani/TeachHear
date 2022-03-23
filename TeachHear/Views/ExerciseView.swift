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
	
	@EnvironmentObject private var youTubeStore: YouTubeStore
	
	@StateObject private var exercise: EditableExercise
	
	@State private var showSaveDialog = false
	
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
					
					LyricsView()
						.environmentObject(exercise)
				}
				.padding([.horizontal, .bottom])
				
				Spacer()
			}
		}
		.background(Color.indigo.opacity(0.35))
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle(exercise.isNew ? String(localized: "New Exercise") : exercise.title)
		.overlay(alignment: .bottomTrailing) {
			if let trackID = youTubeStore.trackID {
				let width = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 3.25
				
				YouTubePlayer(trackID: trackID)
					.frame(width: width,
						   height: width * 9 / 16)
					.cornerRadius(20)
					.padding(.trailing, 40)
					.padding(.bottom, 30)
			}
		}
		.toolbar {
			ToolbarItem(placement: .confirmationAction) {
				if exercise.isNew {
					Button("Done") {
						showSaveDialog = true
					}
					.confirmationDialog("Where do you want to save the exercise?",
										isPresented: $showSaveDialog,
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
			
			ToolbarItem {
				if youTubeStore.trackID == nil {
					Button {
						search()
					} label: {
						Image(systemName: "play.fill")
					}
				} else {
					Button {
						withAnimation {
							youTubeStore.trackID = nil
						}
					} label: {
						Image(systemName: "stop.fill")
					}
				}
			}
		}
		.onDisappear {
			youTubeStore.trackID = nil
		}
	}
	
	// TODO: EditableExercise should include Song with artist, then the search would be more reliable
	private func search() {
		Task {
			try? await youTubeStore.search(for: exercise.title)
		}
	}
	
	private func saveContext() {
		do {
			try moc.save()
		} catch {
			let error = error as NSError
			fatalError("Unresolved error: \(error)")
		}
	}
	
	private func saveToRecents() {
		let newSong = CoreSong(context: moc,
							   id: UUID().uuidString,
							   lyrics: exercise.originalLyrics,
							   title: exercise.title)
		
		_ = CoreExercise(context: moc,
						 date: .now,
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
			.environmentObject(YouTubeStore.shared)
	}
}
