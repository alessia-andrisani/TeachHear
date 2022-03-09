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
	
	@State private var editMode = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack {
				Header("Recents")
				Spacer()
				
				Button(!editMode ? "Edit" : "Done") {
					editMode.toggle()
				}
				.padding(.trailing, 30)
				
				
			}
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(exercises) { exercise in
						ZStack(alignment: .topTrailing) {
							ExerciseItem(exercise: exercise)
							if editMode {
								Button(role: .destructive) {
									deleteExercise(exercise: exercise)
								} label: {
									Image(systemName: "x.circle.fill")
										.font(.title)
								}
								.padding(8)
							}
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
			let error = error as NSError
			fatalError("Unresolver error: \(error)")
		}
	}
	
}

struct RecentsSection_Previews: PreviewProvider {
	static var previews: some View {
		RecentsSection()
	}
}
