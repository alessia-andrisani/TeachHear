//
//  String.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 18/02/22.
//

import Foundation

extension String {
	static let exampleLyrics = """
	Una mattina mi sono alzato
	O bella ciao, bella ciao, bella ciao, ciao, ciao
	Una mattina mi sono alzato
	E ho trovato l'invasor
	
	O partigiano, portami via
	O bella ciao, bella ciao, bella ciao, ciao, ciao
	O partigiano, portami via
	Ché mi sento di morir
	
	E se io muoio da partigiano
	O bella ciao, bella ciao, bella ciao, ciao, ciao
	E se io muoio da partigiano
	Tu mi devi seppellir
	
	E seppellire lassù in montagna
	O bella ciao, bella ciao, bella ciao, ciao, ciao
	E seppellire lassù in montagna
	Sotto l'ombra di un bel fior
	
	Tutte le genti che passeranno
	O bella ciao, bella ciao, bella ciao ciao ciao
	E le genti che passeranno
	Mi diranno: "Che bel fior"
	
	E questo è il fiore del partigiano
	O bella ciao, bella ciao, bella ciao ciao ciao
	Questo è il fiore del partigiano
	Morto per la libertà
	
	E questo è il fiore del partigiano
	Morto per la libertà
	"""
	
	// TODO: It would be better if the punctuation characters were not part of the buttons
	fileprivate func splitOffPunctuation() -> [String] {
		if let punctuationCharacterRange = rangeOfCharacter(from: .punctuationCharacters,
															options: .backwards) {
			let punctuationCharacter = String(self[punctuationCharacterRange])
			
			if punctuationCharacterRange.upperBound == endIndex {
				return ["", String(self.dropLast()), punctuationCharacter]
			} else if punctuationCharacterRange.lowerBound == startIndex {
				return [punctuationCharacter, String(self.dropFirst()), ""]
			}
		}
		
		return ["", self, ""]
	}
	
	fileprivate func containsVaryingCharacters() -> Bool {
		!dropFirst().allSatisfy { $0 == first }
	}
	
	func wordScrambled() -> String {
		let parts = splitOffPunctuation()
		let shuffled = String(parts[1].shuffled())
		
		if count > 1 && shuffled == self && containsVaryingCharacters() {
			return wordScrambled()
		} else {
			return parts[0] + shuffled.lowercased() + parts[2]
		}
	}
	
	func fillTheGapped() -> String {
		let parts = splitOffPunctuation()
		return parts[0] + String(repeating: "_", count: parts[1].count) + parts[2]
	}
}

extension Array where Element == String {
	func sentenceScrambled() -> [String] {
		let shuffled = shuffled()
		
		if count > 1 && self == shuffled {
			return sentenceScrambled()
		} else {
			return shuffled.map { $0.lowercased() }
		}
	}
}

extension Array where Element == Array<String> {
	func toString() -> String {
		map { $0.joined(separator: " ") }
		.joined(separator: "\n")
	}
}
