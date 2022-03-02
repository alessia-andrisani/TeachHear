//
//  ExerciseItem.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct ExerciseItem: View {
	
	var exercise: Exercise
	
    var body: some View {
        NavigationLink(destination: ExerciseView(exercise)) {
			HStack {
                Image("Poster")
                    .resizable()
					.frame(height: 148)
                    .scaledToFit()
                    .cornerRadius(10)
					.aspectRatio(1, contentMode: .fill)
					.frame(width: 148)
				
				VStack(alignment: .leading) {
					Text(exercise.title)  // TODO: Use song.wrappedTitle
						.font(.title3.weight(.semibold))
						.foregroundColor(.primary)
					
					Text(exercise.song.title)  // TODO: Use song.wrappedTitle
						.font(.body.weight(.semibold))
						.foregroundColor(.secondary)
					
				}
				.padding(.horizontal, 3)
			}
			.padding()
			.background {
				Color(uiColor: .secondarySystemGroupedBackground)
					.cornerRadius(20)
			}

		}
    }
}

struct ExerciseItem_Previews: PreviewProvider {
    static var previews: some View {
		ExerciseItem(exercise: Exercise(title: "", song: Song(id: "", title: "", originalLyrics: ""), lyrics: "", date: Date.now))
    }
}
