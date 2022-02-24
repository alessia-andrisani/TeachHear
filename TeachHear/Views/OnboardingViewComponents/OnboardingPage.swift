//
//  ContentView.swift
//  OnboardingPage
//
//  Created by Antonio Scognamiglio on 22/02/22.
//

import SwiftUI

struct OnboardingPage: View {
	let imageName: String
	let previousButton: Bool
	let nextButton: Bool
	let skipButton: Bool
	let startButton: Bool
	
	@Binding var selection: Int
	
	@AppStorage("showOnboarding") private var showOnboarding = true
	
	var body: some View {
		HStack{
			Spacer()
			
			ZStack{
				RoundedRectangle(cornerRadius: 30)
					.frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.85)
					.foregroundColor(Color(uiColor: .systemGroupedBackground))
				//						.padding(.top, 40) //mi sono accorto che quando avvio dal simulatore ci sta qualche spazietto di default che spinge verso l'alto questo rettangolo bianco il che mi urta un po' 😅, per questo ho aggiunto questo padding
				VStack{
					Image(imageName)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: UIScreen.main.bounds.width * 0.18)
						.padding(.top, 40)
						.padding(.bottom, 50)
					
					Group{
						Text("Use music in education")
							.fontWeight(.semibold)
							.font(.largeTitle)
							.padding(.vertical, 3)
						
						Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco l")
							.fontWeight(.regular)
							.font(.system(size: 24))
							.padding(.bottom, 60)
						HStack{
							if skipButton {
								Button(action: {
									withAnimation {
										showOnboarding = false
									}
								}, label: {
									Text("Skip")
										.foregroundColor(.indigo)
										.fontWeight(.semibold)
										.frame(width: 140, alignment: .leading)
								})
							}
							
							Spacer()
							
							Group{
								if previousButton{
									Button(action: {
										withAnimation {
											selection -= 1
										}
									}, label: {
										Text("\(Image(systemName: "chevron.left")) Previous")
											.fontWeight(.semibold)
											.foregroundColor(Color(uiColor: .systemGroupedBackground))
											.frame(width: 140, height: 45.0)
											.background(.indigo)
											.cornerRadius(30)
											.shadow(radius: 2)
											.padding(.horizontal, 7)
									})
								}
								
								
								if nextButton{
									Button(action: {
										withAnimation {
											selection += 1
										}
									}, label: {
										Text("Next \(Image(systemName: "chevron.right"))")
											.fontWeight(.semibold)
											.foregroundColor(Color(uiColor: .systemGroupedBackground))
											.frame(width: 140, height: 45.0)
											.background(.indigo)
											.cornerRadius(30)
											.shadow(radius: 2)
											.padding(.horizontal, 7)
									})
								}
								
								if startButton {
									Button(action: {
										withAnimation {
											showOnboarding = false
										}
									}, label: {
										Text("Get Started")
											.fontWeight(.semibold)
											.foregroundColor(Color(uiColor: .systemGroupedBackground))
											.frame(width: 140, height: 45.0)
											.background(.indigo)
											.cornerRadius(30)
											.shadow(radius: 2)
											.padding(.horizontal, 7)
									})
								}
							}
							
						}
					}
					.frame(width: UIScreen.main.bounds.width * 1 / 2.2, alignment: .leading)
					.padding(.horizontal)
				}
			}
			
			Spacer()
		}
		.frame(width: UIScreen.main.bounds.width * 2 / 3)
	}
}

struct OnboardingPage_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingPage(imageName: "MusicDancer", previousButton: true, nextButton: true, skipButton: true, startButton: false, selection: .constant(0))
			.previewInterfaceOrientation(.landscapeRight)
	}
}
