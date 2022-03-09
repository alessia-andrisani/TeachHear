//
//  FoldersSection.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct FoldersSection: View {
	@State private var showingAddFolderDialog = false
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack {
				Header("Folders")
				
				Spacer()
				
				Button {
					//Add action here
					showingAddFolderDialog = true
				} label: {
					Image(systemName: "folder.badge.plus")
						.font(.title)
				}
				.padding(.trailing, 30)
				.confirmationDialog("Coming Soon", isPresented: $showingAddFolderDialog, titleVisibility: .visible) {
					

				}
			}
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 20) {
					ForEach(0..<1) { _ in
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
