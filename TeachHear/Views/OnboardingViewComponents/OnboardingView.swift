//
//  contentView.swift
//  OnboardingView
//
//  Created by Antonio Scognamiglio on 22/02/22.
//

import SwiftUI

struct OnboardingView: View {
	@State private var selection = 0
	
	var body: some View {
		TabView(selection: $selection) {
			OnboardingPage(imageName: "MusicDancer",
						   previousButton: false,
						   nextButton: true,
						   skipButton: true,
						   startButton: false,
						   selection: $selection)
				.tag(0)
			
			OnboardingPage(imageName: "NoteTaking",
						   previousButton: true,
						   nextButton: true,
						   skipButton: true,
						   startButton: false,
						   selection: $selection)
				.tag(1)
			
			OnboardingPage(imageName: "Teacher",
						   previousButton: true,
						   nextButton: false,
						   skipButton: false,
						   startButton: true,
						   selection: $selection)
				.tag(2)
			
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
		.background(Color.indigo.opacity(0.5))
		//		questo serve per cambiare pagina con lo scroll delle dita e pure è carino, al momento lo lascio nei commenti, però se lo tolgo scompare l'animazione dello scroll, infatti ho nascosto furbamente l'indice, che sarebbero quei 3 pallini in basso con .never
	}
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
