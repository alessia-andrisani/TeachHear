

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
                List{

                    ForEach (0..<shared.songProperties!.filter{ $0.lyrics != nil}.count-1, id: \.self) { index in
                        
                        NavigationLink {

                            let song = Song(id: "\(shared.songProperties!.filter{ $0.lyrics != nil}[index].trackID)",
                                            title: shared.songProperties!.filter{ $0.lyrics != nil}[index].title,
                                            originalLyrics:shared.songProperties!.filter{ $0.lyrics != nil}[index].lyrics ?? "No lyrics")
                            let exercise = Exercise(title: "",
                                                    song: song,
                                                    lyrics: shared.songProperties!.filter{ $0.lyrics != nil}[index].lyrics ?? "No lyrics",
                                                    date: .now)
                            
                            ExerciseView(exercise, isNew: true)

                            
                        } label: {
                            
                            Text(shared.songProperties!.filter{ $0.lyrics != nil}[index].title)
                            
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
