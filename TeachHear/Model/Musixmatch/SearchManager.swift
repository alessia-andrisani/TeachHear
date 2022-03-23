//
//  SongInfoManager.swift
//  TeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation
import SwiftUI

@MainActor class SearchManager: ObservableObject {
	static let shared = SearchManager()
	
	private init() { }
	
	@Published private(set) var results: [SongResult]?
	@Published var showResults = false
	@Published var showAlert = false
	
	public func search(for query: String) async throws {
		clearResults()
		
		guard !query.isEmpty else { return }
		
		let data = try await sendFetchRequest(path: "/ws/1.1/track.search",
											  parameters: [URLQueryItem(name: "q", value: query)])
		
		if let results = self.decodeSearchResults(from: data) {
			try await self.fetchLyrics(for: results)
		}
	}
	
	private func fetchLyrics(for tracks: [TrackInfo]) async throws {
		var songs = [SongResult]()
		
		for trackIndex in tracks.indices {
			let track = tracks[trackIndex]
			let data = try await sendFetchRequest(path: "/ws/1.1/track.lyrics.get",
												  parameters: [URLQueryItem(name: "track_id",
																			value: "\(track.track_id)")])
			
			if let lyrics = decodeLyrics(from: data) {
				songs.append(SongResult(id: track.track_id,
										title: track.track_name,
										lyrics: lyrics))
			}
			
			if trackIndex == tracks.count - 1 {
				if songs.isEmpty {
					showAlert = true
				} else {
					showResults = true
					results = songs
				}
			}
		}
	}
	
	private func sendFetchRequest(path: String, parameters: [URLQueryItem]) async throws -> Data {
		var urlComponents = URLComponents(string: "https://api.musixmatch.com")!
		urlComponents.path = path
		urlComponents.queryItems = parameters + [URLQueryItem(name: "apikey",
															  value: LyricsApiKey().apiKey())]
		
		var request = URLRequest(url: urlComponents.url!)
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse,
			  httpResponse.statusCode == 200 else {
			throw RequestError.serverError
		}
		
		return data
	}
	
	private func decodeSearchResults(from data: Data) -> [TrackInfo]? {
		let queryResponse = try? JSONDecoder().decode(QueryResponse.self, from: data)
		
		if let tracks = queryResponse?.message.body.track_list,
		   !tracks.isEmpty {
			return tracks.map(\.track)
		} else {
			showAlert = true
			return nil
		}
	}
	
	private func decodeLyrics(from data: Data) -> String? {
		let lyricsResponse = try? JSONDecoder().decode(LyricsResponse.self, from: data)

		if let lyrics = lyricsResponse?.message.body.lyrics.lyrics_body,
		   !lyrics.isEmpty {
			return lyrics
		} else {
			return nil
		}
	}
	
	func clearResults() {
		results = nil
		showResults = false
	}
}
