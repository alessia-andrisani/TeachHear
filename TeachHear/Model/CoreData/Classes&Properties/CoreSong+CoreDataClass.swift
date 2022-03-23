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
	convenience init(context moc: NSManagedObjectContext,
					 id: String,
					 lyrics: String,
					 title: String) {
		self.init(context: moc)
		self.id = id
		self.lyrics = lyrics
		self.title = title
	}
}
