//
//  TeachHearApp.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

@main
struct TeachHearApp: App {
	var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, DataController().container.viewContext)
                .environmentObject(SearchManager.shared)
				.environmentObject(YouTubeStore.shared)
        }
    }
}
