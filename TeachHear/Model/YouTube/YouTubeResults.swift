//
//  YouTubeResults.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 24/02/22.
//

import Foundation

struct YoutubeResults: Codable {
	let items: [YouTubeSearchItem]
}

struct YouTubeSearchItem: Codable {
	let id: YouTubeID
}

struct YouTubeID: Codable {
	enum CodingKeys: String, CodingKey {
		case videoID = "videoId"
	}
	
	let videoID: String
}
