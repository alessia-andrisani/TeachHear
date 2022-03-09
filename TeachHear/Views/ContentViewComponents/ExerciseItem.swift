//
//  ExerciseItem.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct ExerciseItem: View {
	let exercise: CoreExercise
	
    var body: some View {
		NavigationLink(destination: ExerciseView(EditableExercise(exercise))) {
			HStack {
                Image("Poster")
                    .resizable()
					.frame(width: 148, height: 148)
					.cornerRadius(10)
				
				VStack(alignment: .leading) {
					Text(exercise.wrappedTitle)
						.font(.title3.weight(.semibold))
						.foregroundColor(.primary)
						.multilineTextAlignment(.leading)
					
					if let exerciseType = exercise.type {
						Text(String(localized: String.LocalizationValue(exerciseType)))
							.font(.body.weight(.medium))
							.foregroundColor(.secondary)
					}
				}
				.padding(.leading, 8)
			}
			.padding()
			.frame(width: 400, alignment: .leading)
			.background {
				Color(uiColor: .secondarySystemGroupedBackground)
					.cornerRadius(20)
			}
		}
		
    }
}

//struct ExerciseItem_Previews: PreviewProvider {
//    static var previews: some View {
//		ExerciseItem(exercise: .exampleExercise)
//    }
//}
