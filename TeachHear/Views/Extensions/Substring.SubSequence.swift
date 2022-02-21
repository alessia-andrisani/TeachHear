//
//  String.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 18/02/22.
//

import Foundation

extension Substring.SubSequence {
	func wordScramble() -> String {
		let shuffled = String(shuffled())
		
		if count != 1 && shuffled == self {
			return wordScramble()
		} else {
			return shuffled.lowercased()
		}
	}
	
	func sentenceScramble() -> String {
		let words = split(separator: " ")
		let shuffled = words.shuffled()
		
		if shuffled == words {
			return sentenceScramble()
		} else {
			return shuffled
				.map { $0.lowercased() }
				.reduce("", { $0.isEmpty ? $1 : ($0 + " " + $1) })
		}
	}
	
	func fillTheGap() -> String {
		String(self.map { _ in return "_" })
	}
}
