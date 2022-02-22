//
//  ContentView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) private var moc
	
	@FetchRequest(sortDescriptors: [SortDescriptor(\.title)], predicate: nil) private var songs: FetchedResults<CoreSong>
	
	var body: some View {
		NavigationView {
			ScrollView {
                VStack(spacing: 20) {
                
                    ZStack {
                    SearchBarView()
                    }
                    
                    
                    ZStack{
                        
                        VStack{
                    
                    FoldersSection()
                    
                    TrendsSection()
                    
                    RecentsSection()
                        }
                    
                   ResultsList()
                      
                    }
                }
			}
			.navigationTitle("Exercises")
			.navigationBarTitleDisplayMode(.inline)
			.background(Color(uiColor: .systemGroupedBackground))
		}
		.navigationViewStyle(.stack)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
