//
//  SearchBarView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct SearchBarView: View {
	@EnvironmentObject private var searchManager: SearchManager
		
	@State private var query = ""
	
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(Color(uiColor: .systemGray2))
			
			TextField("Type artist and song name...", text: $query)
				.disableAutocorrection(true)
				.onSubmit { searchManager.search(for: query) }
			
			if !query.isEmpty {
				Button(action: clearQuery) {
					Image(systemName: "xmark.circle.fill")
						.foregroundColor(Color(uiColor: .systemGray2))
				}
				.padding(.trailing, 8)
			}
			
		}
		.padding()
		.background(Color(uiColor: .secondarySystemGroupedBackground))
		.cornerRadius(.infinity)
		.padding(.horizontal, 20)
	}
	
	private func clearQuery() {
		query = ""
		searchManager.clearResults()
	}
}

struct SearchBarView_Previews: PreviewProvider {
	static var previews: some View {
		SearchBarView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
