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

    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Header("Recents")
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(exercises) { exercise in
						ExerciseItem(exercise: exercise)
					}
				}
				.padding(.horizontal, 20)
			}
		}
    }
}

struct RecentsSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentsSection()
    }
}
