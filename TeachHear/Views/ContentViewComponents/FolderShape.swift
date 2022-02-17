//
//  FolderShape.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 16/02/22.
//

import SwiftUI

struct FolderShape: Shape {
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.1))
		path.addLine(to: CGPoint(x: rect.maxX * 0.7, y: rect.maxY * 0.1))
		path.addLine(to: CGPoint(x: rect.maxX * 0.65, y: rect.maxY * 0.15))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.15))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
		
		return path
	}
}

struct FolderShape_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			Color.indigo.clipShape(FolderShape())
		}
			.previewInterfaceOrientation(.landscapeRight)
	}
}
