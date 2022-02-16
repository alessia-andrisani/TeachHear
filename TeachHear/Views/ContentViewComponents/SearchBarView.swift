//
//  SearchBarView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
		ZStack(alignment: .leading) {
			RoundedRectangle(cornerRadius: 20, style: .continuous)
				.foregroundColor(Color(uiColor: .systemGray5))
				.frame(height: 50)
				.padding(.horizontal)
			
			HStack {
				Image(systemName: "magnifyingglass")
					.foregroundColor(.secondary)
				
				Text("Search for a song")
					.foregroundColor(.secondary)
				
			}
			.padding()
			.padding(.leading)
		}

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
