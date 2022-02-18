//
//  RecentsSection.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 18/02/22.
//

import SwiftUI

struct RecentsSection: View {
    var body: some View {
		VStack(alignment: .leading) {
			Header("Recents")
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(0..<10) { _ in
						ExerciseItem()
					}
				}
				.padding(.horizontal, 20)
			}
		}

    }
}

struct RecentsSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentsSection()
    }
}
