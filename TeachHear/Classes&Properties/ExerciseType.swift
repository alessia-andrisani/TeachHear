//
//  ExerciseType.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 21/02/22.
//

import Foundation
import SwiftUI

enum ExerciseType: String, CaseIterable {
	case wordScramble = "Word Scramble"
	case fillTheGap = "Fill The Gap"
	case sentenceScramble = "Sentence Scramble"
	
	var instructions: LocalizedStringKey {
		switch self {
			case .wordScramble: return "Select the words you want to scramble:"
			case .sentenceScramble: return "Select the sentences you want to scramble:"
			case .fillTheGap: return "Select the words you want to hide:"
		}
	}
}
