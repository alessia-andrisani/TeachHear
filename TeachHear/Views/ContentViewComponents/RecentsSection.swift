//
//  RecentsSection.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct RecentsSection: View {
	
	@EnvironmentObject var exerciseStore: ExerciseStore
	
    var body: some View {
		VStack(alignment: .leading) {
			Header("Recents")
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(exerciseStore.exercises) { exercise in
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
