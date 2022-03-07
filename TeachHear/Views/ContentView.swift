//
//  ContentView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var IDTrackManager: IDTrackManager
    @StateObject var APIMManager = APIManager()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)], predicate: nil) private var exercises: FetchedResults<CoreExercise>
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
					SearchBarView()
                    
                    ZStack(alignment: .top) {
						VStack(spacing: 30) {
							FoldersSection()
								.onTapGesture {
									if IDTrackManager.listAppear == true {
										IDTrackManager.listAppear = false
									}
								}
							
							TrendsSection()
								.onTapGesture {
									if IDTrackManager.listAppear == true {
										IDTrackManager.listAppear = false
									}
									
								}
							
							RecentsSection()
								.padding(.bottom, 30)
								.onTapGesture {
									if IDTrackManager.listAppear == true {
										IDTrackManager.listAppear = false
									}
									
								}
						}
						
						ResultsList()
                            .padding(.top, -33)
                    }
                }
            }
            .navigationTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(uiColor: .systemGroupedBackground))
            .alert("Your search threw no results", isPresented: $IDTrackManager.alertAppear) {
				Button("OK") { }
            }
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
