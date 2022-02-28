//
//  lyricsData.swift
//  APITeachHear
//
//  Created by Diego Castro on 12/02/22.
//

import Foundation

struct FirstData: Codable {
    let message: MessageList
   
}

struct MessageList: Codable {
    let header: HeaderList
    let body: BodyList
}

struct BodyList: Codable {
    let track_list: [Track]
}

struct HeaderList: Codable {
    let status_code: Int
}

struct Track: Codable {
    let track: TrackProperties
}

struct TrackProperties: Codable {
    let track_id: Int
    let has_lyrics: Int
    let track_name : String
}
