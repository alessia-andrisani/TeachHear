//
//  ClearTextFieldButton.swift
//  TeachHear
//
//  Created by Diego Castro on 01/03/22.
//
//
import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var userInput : String
    @EnvironmentObject var IDTTrackManager: IDTrackManager
    
    public func body(content: Content) -> some View {
        ZStack{
            content
            if userInput != "" {
                withAnimation{
            Button {
                userInput = ""
                IDTTrackManager.listAppear = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(uiColor: .systemGray2))
            }.padding(.leading, 1275)
            }
            }
    }
    }
}
