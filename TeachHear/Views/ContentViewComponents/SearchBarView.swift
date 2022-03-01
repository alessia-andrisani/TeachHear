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
            TextField("Type artist and song name...", text: $userInput)
                .onSubmit {
                    searchButton.toggle()
                }.modifier(TextFieldClearButton(userInput: $userInput))
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding(.top)
                .padding(.leading)
            
            Spacer()
            
            Button {
                searchButton.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(uiColor: .systemGray2))
            } .padding(.top)
                .padding(.leading, -3)
                .buttonStyle(.plain)
            
            Spacer()
            
            Spacer()
                .padding()
        }
        .onChange(of: searchButton, perform:  { value in
            let pronnedInput = userInput.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            
            if userInput == "" {
                
            } else {
            
                Task {
                    await APIMManager.fetchData(userInput: pronnedInput)
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


