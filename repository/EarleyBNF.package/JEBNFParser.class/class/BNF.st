grammar
BNF
	" my own BNF "

	^ [ | syntax rule_plus rule nonterminal terminal terminal_character
		letter_digit_underscore_star definitionList lexical_element comma_lexical_element_star 
		letter_symbol letter_digit_underscore_symbol comma_symbol colon_symbol dot_symbol |
	syntax := JENonterminal named: 'syntax'.
	rule_plus := JENonterminal named: 'rule plus'.
	rule := JENonterminal named: 'rule'.
	nonterminal := JENonterminal named: 'nonterminal'.
	terminal := JENonterminal named: 'terminal'.
	terminal_character := JENonterminal named: 'terminal character'.
	letter_digit_underscore_star := JENonterminal named: 'letter digit underscore star'.
	definitionList := JENonterminal named: 'definition list'.
	lexical_element := JENonterminal named: 'lexical element'.
	comma_lexical_element_star := JENonterminal named: 'comma symbol lexical element star'.
	letter_symbol := JENonterminal named: 'letter symbol'.
	letter_digit_underscore_symbol := JENonterminal named: 'letter digit underscore symbol'.
	comma_symbol := JETerminal character: $,.
	colon_symbol := JETerminal character: $:.
	dot_symbol := JETerminal character: $..
	JEGrammar
		basedOn:
			{(syntax is: rule_plus).
			(rule_plus is: rule, rule_plus). (rule_plus is_epsilon).
			(rule is: nonterminal , colon_symbol , definitionList , dot_symbol).
			definitionList is_epsilon.
			(definitionList is: lexical_element , comma_lexical_element_star).
			(comma_lexical_element_star is: comma_symbol , lexical_element , comma_lexical_element_star).
			comma_lexical_element_star is_epsilon.
			(nonterminal is: letter_symbol , letter_digit_underscore_star).
			(letter_digit_underscore_star is: letter_digit_underscore_symbol , letter_digit_underscore_star).
			letter_digit_underscore_star is_epsilon.
			(letter_symbol is: (JETerminal regex: '[a-zA-Z]')).
			(letter_digit_underscore_symbol is: (JETerminal regex: '[a-zA-Z_]')).
			(lexical_element is: nonterminal).
			(lexical_element is: terminal).
			(terminal is: terminal_character).
			(terminal_character is: (JETerminal character: $$) , (JETerminal regex: '[\w\d+-/\\*~=@,%|$&?!<>_-]'))} ]
		value