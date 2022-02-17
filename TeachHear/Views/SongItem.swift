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
		NavigationLink(destination: ExerciseView()) {
			HStack {
				Color.indigo
					.cornerRadius(10)
					.frame(width: 120, height: 120)
				
				VStack(alignment: .leading) {
					Text("Save Your Tears")  // TODO: Use song.wrappedTitle
						.font(.title3.weight(.semibold))
						.foregroundColor(.primary)
				}
				.padding(.horizontal)
			}
			.padding()
			.background {
				Color(uiColor: .secondarySystemGroupedBackground)
					.cornerRadius(20)
			}
//			.shadow(color: Color(uiColor: .systemGray5), radius: 5, x: 2, y: 5)
		}
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
		SongItem()
    }
}
