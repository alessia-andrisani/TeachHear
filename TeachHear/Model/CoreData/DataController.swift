//
//  DataController.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//
import CoreData
import Foundation

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "TeachHear")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("TeachHear failed to load: \(error.localizedDescription)")
				return
			}
			
		}
	}
}
