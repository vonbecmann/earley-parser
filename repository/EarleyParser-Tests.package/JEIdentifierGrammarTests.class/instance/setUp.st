running
setUp
	grammar := [ | identifier word_symbol_star |
	identifier := JENonterminal named: 'identifier'.
	word_symbol_star := JENonterminal named: 'word symbol star'.
	JEGrammar
		basedOn:
			{(identifier is: (JETerminal regex: '[a-zA-Z]') , word_symbol_star).
			(word_symbol_star is: (JETerminal regex: '[\w]') , word_symbol_star).
			word_symbol_star is_epsilon} ] value