//
//  ContentView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct ContentView: View {
	@AppStorage("showOnboarding") private var showOnboarding = true
	
	@EnvironmentObject private var searchManager: SearchManager
	
    var body: some View {
        NavigationView {
            ScrollView {
				LazyVStack(spacing: 30, pinnedViews: .sectionHeaders) {
					Section {
						VStack(spacing: 30) {
							FoldersSection()
							
							TrendsSection()
							
							RecentsSection()
								.padding(.bottom, 30)
						}
						.onTapGesture(perform: hideResults)
					} header: {
						SearchBarView()
							.padding(.vertical, 8)
							.background(Color(uiColor: .systemGroupedBackground))
							.overlay(alignment: .top) {
								if searchManager.showResults,
								   let results = searchManager.results {
									VStack {
										SearchBarView()
											.hidden()
											.padding(.bottom, 8)
										
										SearchResults(results: results)
									}
								}
							}
					}
                }
            }
			.background {
				Color(uiColor: .systemGroupedBackground)
					.ignoresSafeArea()
			}
            .navigationTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
		.alert("Your search threw no results", isPresented: $searchManager.showAlert) { }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
	
	private func hideResults() {
		searchManager.showResults = false
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
