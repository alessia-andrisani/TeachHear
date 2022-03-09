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
	
	@State private var editMode = false
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			let columns = [GridItem(.adaptive(minimum: 400))]
			
			LazyVGrid(columns: columns, spacing: 50) {
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
		}
		.navigationTitle("Simple Present")
		.toolbar {
			ToolbarItem {
				Button(!editMode ? "Edit" : "Done") {
					editMode.toggle()
				}
				.padding(.trailing, 30)
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
