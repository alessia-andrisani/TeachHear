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
						   title: "Welcome to TeachHear!",
						   text: """
Hello teacher! In TeachHear you can create exercises for your language classes using song lyrics. Start by searching for a song that you want to use or just get inspired by our trends section to dive right in.
""", selection: $selection)
				.tag(0)
			
			OnboardingPage(imageName: "NoteTaking",
						   previousButton: true,
						   nextButton: true,
						   skipButton: true,
						   startButton: false,
						   title: "Create your exercise",
						   text: """
You can choose between three different types of exercise: Word Scramble, Fill the Gap and Sentence Scramble. Just choose the one you like and tap the words or sentences you want to use.
""", selection: $selection)
				.tag(1)
			
			OnboardingPage(imageName: "Teacher",
						   previousButton: true,
						   nextButton: false,
						   skipButton: false,
						   startButton: true,
						   title: "Share it during your classes",
						   text: """
 When your exercise is finished, you can save it in a folder and rename it as you like. You can then share the exercise with your students as a PDF or share your screen during your online classes.
 """, selection: $selection)
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
