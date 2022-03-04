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
					.frame(height: 148)
                    .scaledToFit()
                    .cornerRadius(10)
					.aspectRatio(1, contentMode: .fill)
					.frame(width: 148)
				
				VStack(alignment: .leading) {
					Text(exercise.wrappedTitle)
						.font(.title3.weight(.semibold))
						.foregroundColor(.primary)
						.multilineTextAlignment(.leading)
					
					if let title = exercise.song?.title {
						Text(title)
							.font(.body.weight(.semibold))
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
