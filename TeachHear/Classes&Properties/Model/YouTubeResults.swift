//
//  YouTubeResults.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 24/02/22.
//

import Foundation

struct YoutubeResults: Codable {
	let kind: String
	let etag: String
	let nextPageToken: String
	let regionCode: String
	let items: [YouTubeSearchItem]
}

struct YouTubeSearchItem: Codable {
	let id: YouTubeId
	let snippet: Snippet
}

struct YouTubeId: Codable {
	let kind: String
	let videoId: String
}

struct Snippet: Codable {
	let title: String
	let description: String
	let thumbnails: ThumbnailInfo
}

struct ThumbnailInfo: Codable {
	let `default`: ThumbDefaultInfo?
	let high: ThumbHighInfo?
}

struct ThumbDefaultInfo: Codable {
	let url: String
	let width: Int
	let height: Int
}

struct ThumbHighInfo: Codable {
	let url: String
	let width: Int
	let height: Int
}
