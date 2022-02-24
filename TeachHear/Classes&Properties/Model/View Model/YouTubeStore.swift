//
//  YouTubeStore.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 24/02/22.
//

import Foundation

class YouTubeStore: ObservableObject {
	private static let apiKey = "AIzaSyBg7Mod1WCcNXGKrpomKP5PnJkFmm1TR9g"
	
	@Published var trackID = ""
	
	func search(for searchText: String) {
		guard let query = searchText
				.trimmingCharacters(in: .whitespacesAndNewlines)
				.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
		
		fetchYouTubeVideos(searchText: query) { [weak self] results in
			guard let firstResult = results.items.first else { return }
			self?.trackID = firstResult.id.videoId
		}
	}
	
	private func fetchYouTubeVideos(searchText: String, completion: @escaping (YoutubeResults) -> Void) {
		let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(searchText)&regionCode=US&maxResults=1&type=video&key=\(YouTubeStore.apiKey)"
		guard let url = URL(string: urlString) else {return}
		
		let task = URLSession.shared.dataTask(with: url) { jsonData, response, error in
			if let error = error {
				print("Failed to get JSON data", error.localizedDescription)
				return
			}
			
			guard let jsonData = jsonData else {return}
			
			do {
				let youTubeResults = try JSONDecoder().decode(YoutubeResults.self, from: jsonData)
				DispatchQueue.main.async {
					completion(youTubeResults)
				}
			} catch let jsonError {
				print("JSON serialization error", jsonError)
			}
		}
		
		task.resume()
	}
}
