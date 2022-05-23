//
//  YouTubeResults.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 24/02/22.
//

import Foundation

struct YoutubeResults: Codable {
	let ids: [String]
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: ResponseKeys.self)
		var responseContainer = try container.nestedUnkeyedContainer(forKey: .items)
		var ids = [String]()
		
		while !responseContainer.isAtEnd {
			let itemsContainer = try responseContainer.nestedContainer(keyedBy: ItemKeys.self)
			let idContainer = try itemsContainer.nestedContainer(keyedBy: IDKeys.self, forKey: .id)
			ids.append(try idContainer.decode(String.self, forKey: .videoID))
		}
		
		guard !ids.isEmpty else {
			throw DecodingError.valueNotFound(
				String.self,
				DecodingError.Context(
					codingPath: responseContainer.codingPath,
					debugDescription: "No results found"
				)
			)
		}
		
		self.ids = ids
	}
	
	private enum ResponseKeys: String, CodingKey {
		case items
	}
	
	private enum ItemKeys: String, CodingKey {
		case id
	}
	
	private enum IDKeys: String, CodingKey {
		case videoID = "videoId"
	}
}
