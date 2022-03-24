//
//  SearchResponse.swift
//  TeachHear
//
//  Created by Diego Castro on 12/02/22.
//

import Foundation

struct SearchResponse: Codable {
	let message: SearchMessage
}

struct SearchMessage: Codable {
	let body: SearchMessageBody
}

struct SearchMessageBody: Codable {
	enum CodingKeys: String, CodingKey {
		case tracks = "track_list"
	}
	
	let tracks: [Track]
}

struct Track: Codable {
	enum CodingKeys: String, CodingKey {
		case info = "track"
	}
	
	let info: TrackInfo
}

struct TrackInfo: Codable {
	enum CodingKeys: String, CodingKey {
		case id = "track_id"
		case hasLyrics = "has_lyrics"
		case title = "track_name"
	}
	
	let id: Int
	let hasLyrics: Int
	let title: String
}
