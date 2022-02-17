//
//  LyricsView.swift
//  TeachHear
//
//  Created by Gregor Hermanowski on 11/02/22.
//

import SwiftUI

let lyrics = """
E non so bene come dirlo, come farlo
ma ne parlo seriamente
e non conviene se lo fingo, se lo canto
se lo urlo tra la gente
e non mi basta avere un cuore
per provare dell'amore veramente
e non mi servono parole per un poco di piacere
è solamente una questione di

Chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica

E non c'è dove oppure quando
solo fango ed un impianto travolgente
e non c'è anticipo o ritardo
e se rimango vengo ripetutamente
e non m'importa del pudore
delle suore me ne sbatto totalmente
e non mi fare la morale
che alla fine, se Dio vuole è solamente
una questione di

Chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di

E non c'è iodio oppure zinco
è solo marmo bianco e muscoli bollenti
e non c'è podio che non vinco
è solo cardio e conta spingere sui tempi
e non mi serve una Ferrari se non vali
come fante a fari spenti
ma no non contano gli affari
siamo chiari e se compari i coefficienti
è una questione di

Trovare quello giusto
quello che guardi e per un po'
solo un po'
solo un po'
il mondo è solo un ricordo alla fine
se ho gli occhi nei tuoi occhi
e le tue labbra sulle mie labbra
la mano sulla coscia incalza
e credimi ti dico sì
è solo una questione di

Chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
chimica chimica
chi-chi-chi-chi-chi-chi
chimica chimica
è una questione di
"""

struct LyricsView: View {
	init(_ lyrics: String, allowsWordSelection: Bool) {
		let lyricsWithSections = lyrics.replacingOccurrences(of: "\n\n", with: "\n\u{200b}\n")
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
