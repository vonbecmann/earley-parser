running
setUp
	tree := nil.
	grammar := [ | identifier word_symbol_star letter_symbol word_symbol |
	identifier := JENonterminal named: 'identifier'.
	word_symbol_star := JENonterminal named: 'word symbol star'.
	letter_symbol := JENonterminal named: 'letter symbol'.
	word_symbol := JENonterminal named: 'word symbol'.
	JEGrammar
		basedOn:
			{(identifier is: letter_symbol , word_symbol_star).
			(word_symbol_star is: word_symbol , word_symbol_star).	word_symbol_star is_epsilon.
			(letter_symbol is: (JETerminal regex: '[a-zA-Z]')).
			(word_symbol is: (JETerminal regex: '[\w]'))} ] value