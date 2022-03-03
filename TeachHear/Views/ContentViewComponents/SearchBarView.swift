//
//  SearchBarView.swift
//  TeachHear
//
//  Created by Alessia Andrisani on 15/02/22.
//

import SwiftUI

struct SearchBarView: View {
    @EnvironmentObject var IDTTrackManager: IDTrackManager
    @StateObject var APIMManager = APIManager()
    
    @State var userInput : String = ""
    @State var searchButton : Bool = true
    
   
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(uiColor: .systemGray2))
            
            TextField("Type artist and song name...", text: $userInput)
                .onSubmit {
                    searchButton.toggle()
                }
                .disableAutocorrection(true)
            
            if !userInput.isEmpty {
            Button {
                userInput = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(uiColor: .systemGray2))
            }
            .padding(.trailing, 8)
            }
            
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(.infinity)
        .padding()
        .onChange(of: searchButton, perform:  { value in
            let pronnedInput = userInput.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            
            if userInput == "" {
                
            } else {
            
                Task {
                    await APIMManager.fetchData(userInput: pronnedInput!)
            }
            }
        })
        .onChange(of: userInput, perform:  { value in
            if userInput == "" {
                IDTTrackManager.listAppear = false
            }
        })
        
    }
}



struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


