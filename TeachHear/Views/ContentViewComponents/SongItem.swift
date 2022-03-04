//
//  SongView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 17/02/22.
//

import SwiftUI

struct SongItem: View {
//	let song: Song
	
    var body: some View {
		NavigationLink(destination: ExerciseView(.exampleExercise)) {
			VStack {
				Image("Poster")
                    .resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(width: 148, height: 148)
					.cornerRadius(10)
				
				Text("Bella Ciao")  // TODO: Use song.wrappedTitle
					.font(.title3.weight(.semibold))
					.foregroundColor(.primary)
					.padding(.top, 8)
			}
			.padding()
			.background(Color(uiColor: .secondarySystemGroupedBackground))
			.cornerRadius(20)
		}
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
		SongItem()
    }
}
