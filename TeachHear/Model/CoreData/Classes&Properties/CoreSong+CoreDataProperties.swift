//
//  CoreSong+CoreDataProperties.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 22/02/22.
//
//

import Foundation
import CoreData


extension CoreSong {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreSong> {
        return NSFetchRequest<CoreSong>(entityName: "CoreSong")
    }

    @NSManaged public var id: String?
    @NSManaged public var lyrics: String?
    @NSManaged public var title: String?
    @NSManaged public var exercises: NSSet?
	
	
	public var wrappedTitle: String {
		title ?? "No Title"
	}
	
	public var wrappedID: String {
		id ?? "No ID"
	}
	
	public var wrappedLyrics: String {
		lyrics ?? "No Lyrics"
	}
	
	public var exerciseArray: [CoreExercise] {
		let set = exercises as? Set<CoreExercise> ?? []
		
		return set.sorted {
			$0.wrappedTitle < $1.wrappedTitle
		}
	}

}

// MARK: Generated accessors for exercises
extension CoreSong {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: CoreExercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: CoreExercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension CoreSong : Identifiable {

}
