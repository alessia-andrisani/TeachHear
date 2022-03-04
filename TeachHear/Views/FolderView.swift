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
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			let columns = [GridItem(.adaptive(minimum: 400))]
			
			LazyVGrid(columns: columns, spacing: 50) {
				ForEach(exercises) { exercise in
					ExerciseItem(exercise: exercise)
				}
			}
		}
		.navigationTitle("Simple Present")
		.background(Color(uiColor: .systemGroupedBackground))
	}
}

struct FolderView_Previews: PreviewProvider {
	static var previews: some View {
		FolderView()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
