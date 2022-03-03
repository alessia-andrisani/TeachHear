//
//  ContentView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var IDTrackManager: IDTrackManager
    @StateObject var APIMManager = APIManager()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)], predicate: nil) private var songs: FetchedResults<CoreSong>
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    ZStack {
                        SearchBarView()
                    }
                    
                    
                    ZStack{
                        
                        VStack{
                            
                            FoldersSection()
                            
                            TrendsSection()
                            
                            RecentsSection()
                        }
                        ResultsList()
                            .padding(.top, -21.2)
                    }
                }
                
            }
            .navigationTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(uiColor: .systemGroupedBackground))
            .alert(isPresented: $IDTrackManager.alertAppear) {
                Alert (title: Text("Warning"), message: Text("Your search threw no results"), dismissButton: .default(Text("OK")))
                
            }
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
