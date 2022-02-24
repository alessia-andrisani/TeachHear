//
//  SearchBarView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct SearchBarView: View {
	@EnvironmentObject var IDTTrackManager: IDTrackManager
	
	@State var userInput : String = ""
	
	@StateObject var APIMManager = APIManager()
	
	var body: some View {
		HStack {
			TextField("Type artist and song name...", text: $userInput)
				.disableAutocorrection(true)
				.padding(.top)
				.padding(.horizontal)
			
			Spacer()
			
			Button {
				userInput = ""
			} label: {
				Image(systemName: "xmark.circle")
					.foregroundColor(Color(uiColor: .systemGray2))
			}
			
			Spacer()
			
			Spacer()
				.padding()
		}
		.onChange(of: userInput, perform:  { value in
			let pronnedInput = userInput.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
			
			if userInput == "" {
				Task {
					await  APIMManager.fetchData(userInput: "xoloitzcuintle")
				}
				
			} else {
				Task {
					await APIMManager.fetchData(userInput: pronnedInput)
				}
			}
		})
	}
}

struct SearchBarView_Previews: PreviewProvider {
	static var previews: some View {
		SearchBarView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
