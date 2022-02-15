//
//  Song+CoreDataProperties.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var id: String?
    @NSManaged public var lyrics: String?
    @NSManaged public var title: String?
    @NSManaged public var exercise: NSSet?
	
	public var wrappedTitle: String {
		title ?? "No Title"
	}
	
	public var wrappedID: String {
		id ?? "No ID"
	}
	
	public var wrappedLyrics: String {
		lyrics ?? "No Lyrics"
	}
	
	public var exerciseArray: [Exercise] {
		let set = exercise as? Set<Exercise> ?? []
		
		return set.sorted {
			$0.wrappedTitle < $1.wrappedTitle
		}
	}

}

// MARK: Generated accessors for exercise
extension Song {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

extension Song : Identifiable {

}
