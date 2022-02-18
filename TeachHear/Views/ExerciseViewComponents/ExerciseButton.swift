//
//  ExerciseButton.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI


enum ExerciseType: String, CaseIterable {
	case wordScramble = "Word Scramble"
	case sentenceScramble = "Sentence Scramble"
	case fillTheGap = "Fill The Gap"
}

struct ExerciseButton: View {
	let exerciseType: ExerciseType
	@Binding var selectedExerciseType: ExerciseType
    var body: some View {
		Text(exerciseType.rawValue)
			.padding()
			.foregroundColor(selectedExerciseType == exerciseType ? .white : .black)
			.background(selectedExerciseType == exerciseType ? Color.indigo : .white)
			.clipShape(Capsule())
			.shadow(color: Color(uiColor: .systemGray5), radius: 5, x: 3, y: 5)
    }
}

//struct Buttons_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseButton()
//    }
//}
