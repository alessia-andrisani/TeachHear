//
//  Exercise+CoreDataProperties.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var lyrics: String?
    @NSManaged public var title: String?
    @NSManaged public var song: Song?
	
	public var wrappedTitle: String {
		
		title ?? "No Title"
	}
	
	public var wrappedLyrics: String {
		lyrics ?? "No Lyrics"
	}

}

extension Exercise : Identifiable {

}
