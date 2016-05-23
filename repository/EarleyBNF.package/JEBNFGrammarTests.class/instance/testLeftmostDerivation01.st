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
					('letter symbol' -> 1).
					('letter digit underscore star' -> 2).
					('definition list' -> 2).
					('lexical element' -> 1).
					('nonterminal' -> 1).
					('letter symbol' -> 1).
					('letter digit underscore star' -> 2).
					('comma symbol lexical element star' -> 2)})