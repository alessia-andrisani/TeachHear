//
//  FolderView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 17/02/22.
//

import SwiftUI

struct FolderView: View {
	private let columns: [GridItem] =  [GridItem(.adaptive(minimum: 400))]
	
	@EnvironmentObject var exerciseStore: ExerciseStore
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			LazyVGrid(columns: columns, spacing: 50) {
				ForEach(exerciseStore.exercises) { exercise in
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
