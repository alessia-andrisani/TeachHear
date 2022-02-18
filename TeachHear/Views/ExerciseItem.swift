//
//  ExerciseItem.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct ExerciseItem: View {
    var body: some View {
		NavigationLink(destination: ExerciseView()) {
			HStack {
				Color.indigo
					.cornerRadius(10)
					.aspectRatio(1, contentMode: .fill)
				
				VStack(alignment: .leading) {
					Text("Save Your Tears")  // TODO: Use song.wrappedTitle
						.font(.title3.weight(.semibold))
						.foregroundColor(.primary)
					
					Text("Save Your Tears")  // TODO: Use song.wrappedTitle
						.font(.body.weight(.semibold))
						.foregroundColor(.secondary)
					
				}
				.padding(.horizontal, 3)
			}
			.padding()
			.frame(width: 360)
			.background {
				Color(uiColor: .secondarySystemGroupedBackground)
					.cornerRadius(20)
			}

		}
    }
}

struct ExerciseItem_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseItem()
    }
}
