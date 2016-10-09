grammar
BNF
	" 1VWG "

	^ [ | 
		vwg 
		rule 
		nonterminal 
		small_syntactic_mark_plus
		space_and_small_syntactic_mark_plus_option 
		space_and_small_syntactic_mark_plus 
		space_plus 
		terminal terminal_character
		definitionList lexical_element comma_lexical_element_star 
		small_syntactic_mark_symbol space_symbol comma_symbol colon_symbol dot_symbol dollar_symbol |
	vwg := JENonterminal named: 'vwg'.
	rule := JENonterminal named: 'rule'.
	nonterminal := JENonterminal named: 'nonterminal'.
	small_syntactic_mark_plus := JENonterminal named: 'small syntactic mark plus'.
	space_and_small_syntactic_mark_plus_option := JENonterminal named: 'space and small syntactic mark plus option'.
	space_and_small_syntactic_mark_plus := JENonterminal named: 'space and small syntactic mark plus'.
	space_plus := JENonterminal named: 'space plus'.
	
	terminal := JENonterminal named: 'terminal'.
	terminal_character := JENonterminal named: 'terminal character'.
	definitionList := JENonterminal named: 'definition list'.
	lexical_element := JENonterminal named: 'lexical element'.
	comma_lexical_element_star := JENonterminal named: 'comma symbol lexical element star'.
	
	" Representation Rules "
	small_syntactic_mark_symbol := JENonterminal named: 'small syntactic mark symbol'.
	space_symbol := JENonterminal named: 'space symbol'.
	comma_symbol := JETerminal character: $,.
	colon_symbol := JETerminal character: $:.
	dot_symbol := JETerminal character: $..
	dollar_symbol := JENonterminal named: 'dollar symbol'.
	JEGrammar
		basedOn:
			{
			(vwg is: rule). (vwg is: rule, vwg). 
			(rule is: nonterminal , colon_symbol , definitionList , dot_symbol).
			(definitionList is_epsilon).
			(definitionList is: lexical_element , comma_lexical_element_star).
			(comma_lexical_element_star is: comma_symbol , lexical_element , comma_lexical_element_star).
			(comma_lexical_element_star is_epsilon).

			(nonterminal is: small_syntactic_mark_plus, space_and_small_syntactic_mark_plus_option).
	
			(small_syntactic_mark_plus is: small_syntactic_mark_symbol).
			(small_syntactic_mark_plus is: small_syntactic_mark_symbol, small_syntactic_mark_plus). 
			
			(space_and_small_syntactic_mark_plus_option is: space_and_small_syntactic_mark_plus). (space_and_small_syntactic_mark_plus_option is_epsilon).

			(space_and_small_syntactic_mark_plus is: space_plus, small_syntactic_mark_plus).
			(space_and_small_syntactic_mark_plus is: space_plus, small_syntactic_mark_plus, space_and_small_syntactic_mark_plus).
			
			(space_plus is: space_symbol). 
			(space_plus is: space_symbol, space_plus). 

			(lexical_element is: nonterminal).
			(lexical_element is: terminal).
			(terminal is: terminal_character).
			(terminal_character is: dollar_symbol, (JETerminal rxCharSet: '[\w\d+-/\\*~=@,%|$&?!<>_-]')).
			
			" Representation Rules "
			(small_syntactic_mark_symbol is: (JETerminal charset: (($a to: $z), '()'))).
			(space_symbol is: (JETerminal character: Character space)).
			(dollar_symbol is: (JETerminal character: $$)).
			} ]
		value