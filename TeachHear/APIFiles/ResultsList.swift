

//
//  IDTrackManager.swift
//  APITeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation
import SwiftUI


struct ResultsList: View {
	@Environment(\.managedObjectContext) private var moc
	
	@EnvironmentObject var shared: IDTrackManager
	
	var body: some View {
		ZStack {
			if shared.listAppear == true {
				if shared.songProperties?.filter{ $0.lyrics != nil && $0.lyrics != "" }.count ?? 0 > 0  {
					let filteredInfo = shared.songProperties!.filter{ $0.lyrics != nil && $0.lyrics != ""}
					
					List{
						ForEach(filteredInfo, id: \.trackID) { info in
							NavigationLink {
								let exercise = EditableExercise(id: UUID(),
																date: .now,
																title: info.title,
																type: .wordScramble,
																lyrics: info.lyrics!,
																originalLyrics: info.lyrics!,
																isNew: true)
								
								ExerciseView(exercise)
							} label: {
								Text(info.title)
							}
						}
					}
                    .cornerRadius(10)
                    .listStyle(.plain)
					.padding(.horizontal)
					.ignoresSafeArea()
				}
			}
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height / 4,
               alignment: .top)
    }
}
