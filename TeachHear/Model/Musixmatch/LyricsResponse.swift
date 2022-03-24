//
//  LyricsResponse.swift
//  TeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation

struct LyricsResponse: Codable {
    let message: LyricsMessage
}

struct LyricsMessage: Codable {
    let body: LyricsMessageBody
}

struct LyricsMessageBody: Codable {
    let lyrics: Lyrics
}

struct Lyrics: Codable {
	enum CodingKeys: String, CodingKey {
		case body = "lyrics_body"
	}
	
    let body: String
}
