//
//  FolderView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 17/02/22.
//

import SwiftUI

struct FolderView: View {
	@Environment(\.managedObjectContext) private var moc
	
	@FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) private var exercises: FetchedResults<CoreExercise>
	
	@State private var isEditing = false
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			let columns = Array(repeating: GridItem(), count: 2)
			
			LazyVGrid(columns: columns, spacing: 20) {
				ForEach(exercises) { exercise in
					ZStack(alignment: .topTrailing) {
						ExerciseItem(exercise: exercise)
						
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
			}
		}
		.navigationTitle("My Exercises")  // TODO: Replace with folder title
		.toolbar {
			ToolbarItem {
				Button(!isEditing ? "Edit" : "Done") {
					isEditing.toggle()
				}
			}
		}
		.background(Color(uiColor: .systemGroupedBackground))
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

struct FolderView_Previews: PreviewProvider {
	static var previews: some View {
		FolderView()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
