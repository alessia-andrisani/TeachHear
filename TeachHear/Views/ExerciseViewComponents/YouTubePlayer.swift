//
//  YouTubePlayer.swift
//  TeachHear
//
//  Created by Antonio Scognamiglio on 21/02/22.
//

import SwiftUI
import UIKit
import YouTubeiOSPlayerHelper

struct YouTubePlayer: UIViewRepresentable {
	let trackID: String
	
	class Coordinator: NSObject, YTPlayerViewDelegate {
		func playerViewDidBecomeReady(_ playerView: YTPlayerView) { }
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator()
	}
	
	func makeUIView(context: Context) -> YTPlayerView {
		let ytPlayerView = YTPlayerView()
		ytPlayerView.delegate = context.coordinator
		ytPlayerView.load(withVideoId: trackID)
		
		return ytPlayerView
	}
	
	func updateUIView(_ uiView: YTPlayerView, context: Context) { }
}

struct YouTubePlayer_Previews: PreviewProvider {
	static var previews: some View {
		YouTubePlayer(trackID: "XXYlFuWEuKI")
	}
}
