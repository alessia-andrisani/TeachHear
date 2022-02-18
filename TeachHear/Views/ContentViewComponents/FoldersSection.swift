//
//  FoldersSection.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct FoldersSection: View {
	var body: some View {
		VStack(alignment: .leading) {
			Header("Folders")
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(0..<10) { _ in
						FolderItem()
					}
				}
				.padding(.horizontal, 20)
			}
		}
	}
}

struct FoldersSection_Previews: PreviewProvider {
	static var previews: some View {
		FoldersSection()
	}
}
