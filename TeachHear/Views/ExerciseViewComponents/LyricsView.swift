//
//  LyricsView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

let lyrics = """
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

struct LyricsView: View {
	init(_ lyrics: String, allowsWordSelection: Bool) {
		let lyricsWithSections = lyrics.replacingOccurrences(of: "\n\n", with: "\n\u{200b}\n")  // Inserts a invisible character to keep the sections of the text
		let lines = lyricsWithSections.split(separator: "\n")
		let words = lines.map { $0.split(separator: " ") }
		
		_states = .init(initialValue: lines.indices
							.map { words[$0] }
							.map { line in line.map { _ in return false } })
		
		self.lines = lines
		self.words = words
		self.allowsWordSelection = allowsWordSelection
	}
	
	@State private var states: [[Bool]]
	
	private let lines: [String.SubSequence]
	private let words: [[Substring.SubSequence]]
	private let allowsWordSelection: Bool
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				ForEach(lines.indices, id: \.self) { lineIndex in
					if allowsWordSelection {
						HStack(spacing: .zero) {
							ForEach(words[lineIndex].indices, id: \.self) { wordIndex in
								LyricButton(String(words[lineIndex][wordIndex] + " "),
											isHighlighted: $states[lineIndex][wordIndex])
							}
						}
					} else {
						LyricButton(String(lines[lineIndex]) + " ",
									isHighlighted: $states[lineIndex][0])
					}
				}
			}
			.padding(20)
		}
		.background(Color(uiColor: .systemGroupedBackground))
		.cornerRadius(30)
	}
}

struct LyricsView_Previews: PreviewProvider {
	static var previews: some View {
		LyricsView(lyrics, allowsWordSelection: true)
			.previewDevice("iPad Pro (11-inch) (3rd generation)")
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
