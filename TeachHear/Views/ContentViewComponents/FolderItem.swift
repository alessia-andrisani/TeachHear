//
//  FolderItem.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 18/02/22.
//

import SwiftUI

struct FolderItem: View {
	//	let folder: Folder
	
	var body: some View {
		NavigationLink(destination: FolderView()) {
			Image("Folder")
				.overlay {
					Text("My Exercises")
						.font(.title3.bold())
						.foregroundColor(.indigo)
						.padding(.top, 20)
				}
		}
	}
}

struct FolderItem_Previews: PreviewProvider {
	static var previews: some View {
		FolderItem()
	}
}
