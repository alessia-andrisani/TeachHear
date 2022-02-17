//
//  Header.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 17/02/22.
//

import SwiftUI

struct Header: View {
	internal init(_ title: LocalizedStringKey) {
		self.title = title
	}
	
	let title: LocalizedStringKey
	
    var body: some View {
		Text(title)
			.font(.title.bold())
			.padding(.leading, 30)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header("Test")
    }
}
