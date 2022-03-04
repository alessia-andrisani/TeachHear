//
//  TeachHearApp.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

@main
struct TeachHearApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(IDTrackManager.shared)
				.environmentObject(YouTubeStore.shared)
        }
    }
}
