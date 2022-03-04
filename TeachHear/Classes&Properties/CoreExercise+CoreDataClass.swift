//
//  CoreExercise+CoreDataClass.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//
//

import Foundation
import CoreData

@objc(CoreExercise)
public class CoreExercise: NSManagedObject {
	func setValues(date: Date,
				   id: UUID,
				   lyrics: String,
				   title: String,
				   song: CoreSong,
				   type: String) {
		self.date = date
		self.id = id
		self.lyrics = lyrics
		self.title = title
		self.song = song
		self.type = type
	}
}
