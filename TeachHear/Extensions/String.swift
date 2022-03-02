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
	
	fileprivate func containsVaryingCharacters() -> Bool {
		!dropFirst().allSatisfy { $0 == first }
	}
	
	mutating func wordScrambled() {
		let shuffled = String(shuffled())
		
		if count > 1 && shuffled == self && containsVaryingCharacters() {
			wordScrambled()
		} else {
			self = shuffled.lowercased()
		}
	}
	
	mutating func fillTheGapped() {
		self = String(map { _ in return "_" })
	}
}

extension Array where Element == String {
	mutating func sentenceScrambled()  {
		let shuffled = shuffled()
		
		if count > 1 && self == shuffled {
			sentenceScrambled()
		} else {
			self = shuffled.map { $0.lowercased() }
		}
	}
}

extension Array where Element == Array<String> {
	func toString() -> String {
		map { $0.joined(separator: " ") }
		.joined(separator: "\n")
	}
}
