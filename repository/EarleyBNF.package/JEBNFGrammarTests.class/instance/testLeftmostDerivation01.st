tests
testLeftmostDerivation01
	| forest |
	forest := grammar parse: 'E=T.'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('nonterminal' -> 1).
					('letter_symbol' -> 1).
					('letter_digit_underscore_star' -> 2).
					('definition_list' -> 2).
					('grammar_symbol' -> 1).
					('nonterminal' -> 1).
					('letter_symbol' -> 1).
					('letter_digit_underscore_star' -> 2).
					('comma_grammar_symbol_star' -> 2)})