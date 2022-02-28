

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
            
            if shared.songProperties?.filter{ $0.lyrics != nil}.count ?? 0 > 0 {
            if shared.listAppear == true {
                let filteredInfo = shared.songProperties!.filter{ $0.lyrics != nil}
                List{

                    ForEach (0..<filteredInfo.count-1, id: \.self) { index in
                        
                        NavigationLink {

                            let song = Song(id: "\(filteredInfo[index].trackID)",
                                            title: filteredInfo[index].title,
                                            originalLyrics: filteredInfo[index].lyrics ?? "No lyrics")
                            let exercise = Exercise(title: "",
                                                    song: song,
                                                    lyrics: filteredInfo[index].lyrics ?? "No lyrics",
                                                    date: .now)
                            
                            ExerciseView(exercise, isNew: true)

                            
                        } label: {
                            
                            Text(filteredInfo[index].title)
                            
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
}
