//
//  GridExercisesView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 17/02/22.
//

import SwiftUI

struct GridExercisesView: View {
	
	private let columns: [GridItem] =  [GridItem(.adaptive(minimum: 400))]
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			LazyVGrid(columns: columns, spacing: 50) {
				ForEach(0..<14) { _ in
					
					NavigationLink(destination: ExerciseView()) {
						HStack {
							ZStack(alignment: .leading) {
								RoundedRectangle(cornerRadius: 13)
									.strokeBorder(lineWidth: 0.1)
									.foregroundColor(.secondary)
									.frame(width: 360, height: 160)
									.background(Color(uiColor: .systemGray6))
									.mask(RoundedRectangle(cornerRadius: 7))
									.shadow(color: Color(uiColor: .systemGray5), radius: 5, x: 2, y: 5)
								HStack {
									RoundedRectangle(cornerRadius: 10)
										.foregroundColor(.indigo)
										.frame(width: 120, height: 120)
										.padding()
									VStack {
										Text("Save Your Tears")
											.fontWeight(.semibold)
											.font(.system(size: 20))
										Text("Sentence Scramble")
											.font(.system(size: 17))
									}
								}
							}
						}
						.padding(.trailing)
					}
				}
			}
		}
		.navigationTitle("Simple Present")
    }
}

struct GridExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        GridExercisesView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
