//
//  SongInfoManager.swift
//  TeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation
import SwiftUI

public class SearchManager: ObservableObject {
	static let shared = SearchManager()
	
	private init() { }
	
	@Published private(set) var results: [SongResult]?
	@Published var showResults = false
	@Published var showAlert = false
	
	public func search(for query: String) {
		guard !query.isEmpty,
			  let formattedInput = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
			  let url = URL(string: "https://api.musixmatch.com/ws/1.1/track.search?q=\(formattedInput)&apikey=\(LyricsApiKey().apiKey())") else { return }
		let session = URLSession(configuration: .default)
		
		let searchTask = session.dataTask(with: url) { [weak self] (data, response, error) in
			guard let `self` = self else { return }
			
			guard error == nil else {
				fatalError(error!.localizedDescription)
			}
			
			if let data = data,
			   let results = self.decodeQueryResults(from: data) {
				self.fetchSongData(for: results)
			}
		}
		
		searchTask.resume()
	}
	
	private func decodeQueryResults(from data: Data) -> [TrackInfo]? {
		let decoder = JSONDecoder()
		
		do {
			let queryResponse = try decoder.decode(QueryResponse.self, from: data)
			
			guard queryResponse.message.header.status_code == 200 else {
				print("An Error Ocurred while requesting the lyrics")
				return nil
			}
			
			let tracks = queryResponse.message.body.track_list
			
			guard !tracks.isEmpty else {
				showAlert = true
				return nil
			}
			
			return tracks.map(\.track)
		} catch {
			print(error)
			return nil
		}
	}
	
	private func fetchSongData(for tracks: [TrackInfo]) {
		var songs = [SongResult]()
		
		for trackIndex in tracks.indices {
			let track = tracks[trackIndex]
			let session = URLSession(configuration: .default)
			
			if let songURL = URL(string: "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=\(track.track_id)&apikey=\(LyricsApiKey().apiKey())") {
				let task = session.dataTask(with: songURL) { [weak self] (data, response, error) in
					guard let `self` = self else { return }
					
					guard error == nil else {
						fatalError(error!.localizedDescription)
					}
					
					if let data = data,
					   let lyrics = self.decodeLyrics(from: data) {
						if !lyrics.isEmpty {
							songs.append(SongResult(id: track.track_id,
													title: track.track_name,
													lyrics: lyrics))
						}
					}
					
					if trackIndex == tracks.count - 1 {
						DispatchQueue.main.sync {
							self.showResults = !songs.isEmpty
							self.results = !songs.isEmpty ? songs : nil
							
							if tracks.isEmpty {
								self.showAlert = true
							}
						}
					}
				}
				
				task.resume()
			}
		}
	}
	
	private func decodeLyrics(from data: Data) -> String? {
		let decoder = JSONDecoder()
		
		do {
			let lyricsResponse = try decoder.decode(LyricsResponse.self, from: data)
			
			guard lyricsResponse.message.header.status_code == 200 else {
				print("An Error Ocurred while requesting the lyrics")
				return nil
			}
			
			return lyricsResponse.message.body.lyrics.lyrics_body
		} catch {
			return nil
		}
	}
	
	func clearResults() {
		results = nil
		showResults = false
	}
}
