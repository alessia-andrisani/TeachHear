//
//  ContentView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct ContentView: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@FetchRequest(sortDescriptors: [SortDescriptor(\.title)], predicate: nil) var songs: FetchedResults<Song>
	
	var body: some View {
		NavigationView {
			ScrollView(.vertical) {
				SearchBarView()
					.padding([.top, .bottom])
				
				FoldersView()
					.padding(.bottom)
				
				TrendsView()
					.padding(.bottom)
				
				RecentsView()
					.padding(.bottom)
				
			}
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
