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
    let header: MessageHeader
    let body: LyricsMessageBody
}

struct LyricsMessageBody: Codable {
    let lyrics: Lyrics
}

struct Lyrics: Codable {
    let lyrics_body: String
}
