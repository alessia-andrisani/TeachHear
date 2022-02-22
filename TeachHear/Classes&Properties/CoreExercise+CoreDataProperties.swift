//
//  CoreExercise+CoreDataProperties.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//
//

import Foundation
import CoreData


extension CoreExercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreExercise> {
        return NSFetchRequest<CoreExercise>(entityName: "CoreExercise")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var lyrics: String?
    @NSManaged public var title: String?
    @NSManaged public var song: CoreSong?
	
	public var wrappedTitle: String {
		
		title ?? "No Title"
	}
	
	public var wrappedLyrics: String {
		lyrics ?? "No Lyrics"
	}

}

extension CoreExercise : Identifiable {

}