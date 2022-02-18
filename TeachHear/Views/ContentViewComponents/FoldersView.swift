//
//  FoldersView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct FoldersView: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Folders")
				.fontWeight(.bold)
				.font(.system(size: 25))
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 50) {
					ForEach(0..<10) { _ in
						
						NavigationLink(destination: FolderView()) {
							ZStack {
								Image("Folder")
									.shadow(color: Color(uiColor: .systemGray5), radius: 5, x: 3, y: 5)
								Text("Simple Present")
									.font(.system(size: 20))
									.fontWeight(.bold)
									.foregroundColor(.indigo)
							}
						}
					}
				}
				.padding(.trailing)
			}
			
		}
		.padding(.all)
	}
}

struct FoldersView_Previews: PreviewProvider {
	static var previews: some View {
		FoldersView()
	}
}
