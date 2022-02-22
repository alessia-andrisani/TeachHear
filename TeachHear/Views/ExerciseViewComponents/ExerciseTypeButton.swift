//
//  ExerciseTypeButton.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct ExerciseTypeButton: View {
	init(_ exerciseType: ExerciseType, selected selectedExerciseType: Binding<ExerciseType>) {
		_selectedExerciseType = selectedExerciseType
		
		self.exerciseType = exerciseType
	}
	
	@Binding private var selectedExerciseType: ExerciseType
	
	private let exerciseType: ExerciseType
	
	var body: some View {
		Button {
			selectedExerciseType = exerciseType
		} label: {
			Text(String(localized: String.LocalizationValue(exerciseType.rawValue)))
				.padding()
				.foregroundColor(selectedExerciseType == exerciseType ? .white : .primary)
				.background(selectedExerciseType == exerciseType ? Color.indigo : Color(uiColor: .tertiarySystemGroupedBackground))
				.clipShape(Capsule())
		}
	}
}

struct ExerciseTypeButton_Previews: PreviewProvider {
	static var previews: some View {
		ExerciseTypeButton(.wordScramble, selected: .constant(.fillTheGap))
	}
}
