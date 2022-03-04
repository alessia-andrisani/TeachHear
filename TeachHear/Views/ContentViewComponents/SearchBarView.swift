//
//  SearchBarView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct SearchBarView: View {
	@EnvironmentObject var idTrackManager: IDTrackManager
	
	@StateObject var apiManager = APIManager()
	
	@State var userInput : String = ""
	@State var searchButton : Bool = true
	
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(Color(uiColor: .systemGray2))
			
			TextField("Type artist and song name...", text: $userInput)
				.disableAutocorrection(true)
				.onSubmit {
					guard !userInput.isEmpty else { return }
					
					let pronnedInput = userInput.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
					
					Task {
						await apiManager.fetchData(userInput: pronnedInput!)
					}
				}
			
			if !userInput.isEmpty {
				Button {
					userInput = ""
				} label: {
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
		.onChange(of: userInput) { newValue in
			if newValue.isEmpty {
				idTrackManager.listAppear = false
			}
		}
	}
}

struct SearchBarView_Previews: PreviewProvider {
	static var previews: some View {
		SearchBarView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
