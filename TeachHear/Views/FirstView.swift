//
//  FirstView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
		VStack {
			ZStack {
				VStack(alignment: .leading) {
					
					SearchBarView()
						.padding(.top)
					
					Spacer()
					Text("Folders")
						.fontWeight(.bold)
						.font(.system(size: 25))
						.padding()
					Group {
						Spacer()
						Spacer()
						Spacer()
						Spacer()
						
					}
					
					
					TrendsView()
						.padding(.bottom)
					
					
					
					
					
				}
				
				Image("FolderPlaceholder")
			}
			
			Spacer()
			
		}
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
