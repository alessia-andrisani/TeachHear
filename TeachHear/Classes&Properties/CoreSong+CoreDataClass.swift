//
//  CoreSong+CoreDataClass.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//
//

import Foundation
import CoreData

@objc(CoreSong)
public class CoreSong: NSManagedObject {
	func setValues(id: String, lyrics: String, title: String) {
		self.id = id
		self.lyrics = lyrics
		self.title = title
	}
}
