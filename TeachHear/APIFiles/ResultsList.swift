

//
//  IDTrackManager.swift
//  APITeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation
import SwiftUI


struct ResultsList : View {
    @EnvironmentObject var shared: IDTrackManager

    
    var body: some View {
        
        ZStack {
//            if shared.filteredListOfSongLyrics == Array(repeating: "", count: 10)  {  }
             if shared.listAppear == true {
              
                List{
                    
                    ForEach (0..<shared.filteredListOfHasLyricsCodes!.filter{$0 > 0}.count, id: \.self) { index in
                        
                        NavigationLink {
                            //Check if the lyrics of the song are available
//                            if shared.filteredListOfHasLyricsCodes![index] == 0 {
//
////                                ExerciseView(lyrics: "No lyrics Available ☹️", isNew: true)
//
//                            } else {
								let song = Song(id: "\(shared.filteredListOfTrackedIDs![index])",
												title: shared.filteredListOfFinalTittles![index],
												originalLyrics: shared.filteredListOfSongLyrics![index])
								let exercise = Exercise(title: "",
														song: song,
														lyrics: shared.filteredListOfSongLyrics![index],
														date: .now)
                                
                                ExerciseView(exercise, isNew: true)
//                            }
                            
                        } label: {
                            
                            Text(shared.filteredListOfFinalTittles![index])
 
                        }
                        
                    }
                }
                .listStyle(PlainListStyle())
                    .padding(.horizontal)
                    .ignoresSafeArea()
                
            
        }
        }
    }
}
