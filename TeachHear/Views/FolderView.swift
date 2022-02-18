//
//  FolderView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 17/02/22.
//

import SwiftUI

struct FolderView: View {
	private let columns: [GridItem] =  [GridItem(.adaptive(minimum: 400))]
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			LazyVGrid(columns: columns, spacing: 50) {
				ForEach(0..<14) { _ in
					ExerciseItem()
				}
			}
		}
		.navigationTitle("Simple Present")
		.background(Color(uiColor: .systemGroupedBackground))
	}
}

struct FolderView_Previews: PreviewProvider {
	static var previews: some View {
		FolderView()
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
