grammar
BNF
	" my own BNF "

	^ [ | rule nonterminal letter_digit_underscore_star definitionList lexical_element comma_lexical_element_star literal letter_symbol letter_digit_underscore_symbol comma_symbol equals_symbol dot_symbol |
	rule := JENonterminal named: 'rule'.
	nonterminal := JENonterminal named: 'nonterminal'.
	letter_digit_underscore_star := JENonterminal named: 'letter digit underscore star'.
	definitionList := JENonterminal named: 'definition list'.
	lexical_element := JENonterminal named: 'lexical element'.
	comma_lexical_element_star := JENonterminal named: 'comma symbol lexical element star'.
	literal := JENonterminal named: 'literal'.
	letter_symbol := JENonterminal named: 'letter symbol'.
	letter_digit_underscore_symbol := JENonterminal named: 'letter digit underscore symbol'.
	comma_symbol := JETerminal character: $,.
	equals_symbol := JETerminal character: $=.
	dot_symbol := JETerminal character: $..
	JEGrammar
		basedOn:
			{(rule is: nonterminal , equals_symbol , definitionList , dot_symbol).
			definitionList is_epsilon.
			(definitionList is: lexical_element , comma_lexical_element_star).
			(comma_lexical_element_star is: comma_symbol , lexical_element , comma_lexical_element_star).
			comma_lexical_element_star is_epsilon.
			(nonterminal is: letter_symbol , letter_digit_underscore_star).
			(letter_digit_underscore_star is: letter_digit_underscore_symbol , letter_digit_underscore_star).
			letter_digit_underscore_star is_epsilon.
			(letter_symbol is: (JETerminal charset: ($a to: $z) , ($A to: $Z))).
			(letter_digit_underscore_symbol is: (JETerminal charset: ($a to: $z) , ($A to: $Z) , '_')).
			(lexical_element is: nonterminal).
			(lexical_element is: literal).
			(literal
				is: (JETerminal character: $") , (JETerminal regex: '[\w\d+-/\\*~=@,%|&?!<>]') , (JETerminal character: $"))} ]
		value