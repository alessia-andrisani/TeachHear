//
//  QueryResponse.swift
//  TeachHear
//
//  Created by Diego Castro on 12/02/22.
//

import Foundation

struct QueryResponse: Codable {
	let message: Message
}

struct Message: Codable {
	let header: MessageHeader
	let body: MessageBody
}

struct MessageHeader: Codable {
	let status_code: Int
}

struct MessageBody: Codable {
	let track_list: [Track]
}

struct Track: Codable {
	let track: TrackInfo
}

struct TrackInfo: Codable {
	let track_id: Int
	let has_lyrics: Int
	let track_name : String
}
