//
//  YouTubeStore.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 24/02/22.
//

import Foundation

@MainActor class YouTubeStore: ObservableObject {
	static var shared = YouTubeStore()
	
	private init() { }
	
	@Published var trackID: String? = nil
	
	func search(for query: String) async throws {
		trackID = nil
		
		guard !query.isEmpty else { return }
		
		var urlComponents = URLComponents(string: "https://www.googleapis.com")!
		urlComponents.path = "/youtube/v3/search"
		urlComponents.queryItems = ["part": "snippet",
									"q": query,
									"regionCode": "US",
									"maxResults": "1",
									"type": "video",
									"key": Self.apiKey]
			.map { URLQueryItem(name: $0.key, value: $0.value) }
		
		var request = URLRequest(url: urlComponents.url!)
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse,
			  httpResponse.statusCode == 200 else {
			throw RequestError.serverError
		}
		
		let results = try? JSONDecoder().decode(YoutubeResults.self, from: data)
		trackID = results?.items.first?.id.videoID
	}
}
