example
BNF
	" my own BNF "

	^ [ 
	| rule nonterminal letter_digit_underscore_star definitionList grammar_symbol comma_grammar_symbol_star literal letter_symbol letter_digit_underscore_symbol comma_symbol equals_symbol dot_symbol |
	rule := JENonterminal named: 'rule'.
	nonterminal := JENonterminal named: 'nonterminal'.
	letter_digit_underscore_star := JENonterminal named: 'letter digit underscore star'.
	definitionList := JENonterminal named: 'definition list'.
	grammar_symbol := JENonterminal named: 'grammar symbol'.
	comma_grammar_symbol_star := JENonterminal named: 'comma symbol grammar symbol star'.
	literal := JENonterminal named: 'literal'.
	letter_symbol := JENonterminal named: 'letter symbol'.
	letter_digit_underscore_symbol := JENonterminal named: 'letter digit underscore symbol'.
	comma_symbol := JETerminal character: $,.
	equals_symbol := JETerminal character: $=.
	dot_symbol := JETerminal character: $..
	JEGrammar
		basedOn:
			{(rule is: nonterminal , equals_symbol , definitionList , dot_symbol).
			(definitionList is_epsilon).
			(definitionList is: grammar_symbol , comma_grammar_symbol_star).
			(comma_grammar_symbol_star is: comma_symbol , grammar_symbol , comma_grammar_symbol_star).
			(comma_grammar_symbol_star is_epsilon).
			(nonterminal is: letter_symbol , letter_digit_underscore_star).
			(letter_digit_underscore_star is: letter_digit_underscore_symbol , letter_digit_underscore_star).
			(letter_digit_underscore_star is_epsilon).
			(letter_symbol is: (JETerminal charset: '[a-zA-Z]')).
			(letter_digit_underscore_symbol is: (JETerminal charset: '[a-zA-Z0-9_]')).
			(grammar_symbol is: nonterminal).
			(grammar_symbol is: literal).
			(literal
				is: (JETerminal character: $") , (JETerminal charset: '[\w\d+-/\\*~=@,%|&?!<>]') , (JETerminal character: $"))} ]
		value