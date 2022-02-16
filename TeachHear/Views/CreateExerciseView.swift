//
//  CreateExerciseView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 16/02/22.
//

import SwiftUI

struct CreateExerciseView: View {
	@State var selectedExerciseType = ExerciseType.wordScramble
    var body: some View {
		
		ZStack {
			Color.indigo
				.ignoresSafeArea()
			VStack {
				ZStack(alignment: .leading) {
					RoundedRectangle(cornerRadius: 30, style: .continuous)
						.foregroundColor(Color.white)
						.frame(height: 121)
					//						.frame(width: 820, height: 121)
					
					VStack(alignment: .leading) {
						
						Text("Exercise type")
							.fontWeight(.semibold)
							.font(.system(size: 22))
							.padding()
						
						HStack {
							ForEach(ExerciseType.allCases, id: \.self) { exerciseType in
								Button {
									selectedExerciseType = exerciseType
								} label: {
									ExerciseButton(exerciseType: exerciseType,
												   selectedExerciseType: $selectedExerciseType)
								}
								
							}
							
						}
						.padding([.bottom, .leading])
					}
				}
				
				ZStack {
					RoundedRectangle(cornerRadius: 30, style: .continuous)
						.foregroundColor(Color.white)
						.ignoresSafeArea(edges: .vertical)
					
					ScrollView(.vertical, showsIndicators: true) {
						Text("""
Ooh
Na-na, yeah
I saw you dancing in a crowded room
You look so happy when I'm not with you
But then you saw me, caught you by surprise
A single teardrop falling from your eye
I don't know why I run away
I'll make you cry when I run away
You could've asked me why I broke your heart
You could've told me that you fell apart
But you walked past me like I wasn't there
And just pretended like you didn't care
I don’t know why I run away
I'll make you cry when I run away
Take me back 'cause I wanna stay
Save your tears for another
Save your tears for another day
Save your tears for another day
So, I made you think that I would always stay
I said some things that I should never say
Yeah, I broke your heart like someone did to mine
And now you won't love me for a second time
I don't know why I run away, oh, girl
Said I'll make you cry when I run away
Girl, take me back 'cause I wanna stay
Save your tears for another
I realize that I'm much too late
And you deserve someone better
Save your tears for another day (ooh, yeah)
Save your tears for another day (yeah)
I don't know why I run away
I'll make you cry when I run away
Save your tears for another day, ooh, girl (ah)
I said save your tears for another day (ah)
Save your tears for another day (ah)
Save your tears for another day (ah)

""")
							.font(.largeTitle)
						
					}
				}
				
			}
			.frame(minWidth: 820, idealWidth: 820, maxWidth: 900, minHeight: 800, idealHeight: .infinity, maxHeight: .infinity)
		}
		.navigationTitle("New Exercise")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
