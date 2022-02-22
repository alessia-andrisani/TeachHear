//
//  ExerciseStore.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//

import Foundation


class ExerciseStore: ObservableObject {
	
	@Published var exercises: [Exercise] = []
	
}
