//
//  UnitTests.swift
//  UnitTests
//
//  Created by Gregor Hermanowski on 23. May.
//

import XCTest

class UnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
	}
	
	func testYouTubeResultDecoding() throws {
		let expectedID = "0aUav1lx3rA"
		let json = """
  {
  "kind": "youtube#searchListResponse",
  "etag": "XBg1eQPIEEiMpC_wzThdx4uisQs",
  "nextPageToken": "CAEQAA",
  "regionCode": "US",
  "pageInfo": {
    "totalResults": 1000000,
    "resultsPerPage": 1
  },
  "items": [
    {
      "kind": "youtube#searchResult",
      "etag": "hFfX32mzNb5NB5Ip9Nx0D6lj2VA",
      "id": {
        "kind": "youtube#video",
        "videoId": "0aUav1lx3rA"
      },
      "snippet": {
        "publishedAt": "2020-04-11T15:55:35Z",
        "channelId": "UCzrTsagimO8Ao2qCRnVPUHA",
        "title": "La Casa De Papel - Bella Ciao [Lyrics] (Money Heist)",
        "description": "Subscribe To ReLike Vibes For New Music! https://shrinke.me/VqUAj8SU ReLike Vibes Spotify https://shrinke.me/VK9DJZ ReLike ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/0aUav1lx3rA/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/0aUav1lx3rA/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/0aUav1lx3rA/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "ReLike Vibes",
        "liveBroadcastContent": "none",
        "publishTime": "2020-04-11T15:55:35Z"
      }
    }
  ]
  }
  """
		let data = json.data(using: .utf8)!
		let decodedResult = try JSONDecoder().decode(YoutubeResults.self, from: data)
		
		XCTAssertNotNil(decodedResult.ids.first)
		XCTAssert(decodedResult.ids.first!.contains(expectedID))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
