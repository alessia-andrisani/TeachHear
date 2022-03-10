//
//  RecentsSection.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct RecentsSection: View {
	@Environment(\.managedObjectContext) private var moc
	
	@FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) private var exercises: FetchedResults<CoreExercise>
	
	@State private var isEditing = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack {
				Header("Recents")
				
				Spacer()
				
				Button(!isEditing ? "Edit" : "Done") {
					isEditing.toggle()
				}
				.padding(.trailing, 30)
			}
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(exercises) { exercise in
						ZStack(alignment: .topTrailing) {
							ExerciseItem(exercise: exercise)
								.rotationEffect(.degrees(isEditing ? 2.5 : 0 ))
								.animation(isEditing ? .easeInOut(duration: 0.15).repeatForever(autoreverses: true) : .easeInOut(duration: 0.15), value: isEditing)
							
							if isEditing {
								Button(role: .destructive) {
									deleteExercise(exercise: exercise)
								} label: {
									Image(systemName: "trash.fill")
										.padding()
								}
							}
						}
						
					}
					.onChange(of: exercises.count) { count in
						if count == 0 {
							isEditing = false 
						}
					}
				}
				.padding(.horizontal, 20)
			}
		}
	}
	
	private func deleteExercise(exercise: CoreExercise) {
		withAnimation {
			moc.delete(exercise)
			saveContext()
		}
	}
	
	private func saveContext() {
		do {
			try moc.save()
		} catch {
			fatalError("Unresolved error: \(error)")
		}
	}
	
}

struct RecentsSection_Previews: PreviewProvider {
	static var previews: some View {
		RecentsSection()
	}
}
