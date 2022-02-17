//
//  TrendsView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct TrendsSection: View {
	var body: some View {
		VStack(alignment: .leading) {
			Header("Trends")
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(0..<10) { _ in
						SongItem()
					}
				}
				.padding(.horizontal, 20)
			}
		}
	}
}

struct TrendsView_Previews: PreviewProvider {
	static var previews: some View {
		TrendsSection()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
