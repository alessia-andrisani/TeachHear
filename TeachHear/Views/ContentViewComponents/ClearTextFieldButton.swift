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
    
    func body(content: Content) -> some View {
        HStack {
            content
            Button {
                userInput = ""
                IDTTrackManager.listAppear = false
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(Color(uiColor: .systemGray2))
            }
        }
    }
}
