tests
testRightmostDerivation01
	tree := grammar parseTree: 'E=T.'.
	self
		assertCollection: tree rightmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('definition list' -> 2).
					('comma symbol lexical element star' -> 2).
					('lexical element' -> 1).
					('nonterminal' -> 1).
					('letter digit underscore star' -> 2).
					('letter symbol' -> 1).
					('nonterminal' -> 1).
					('letter digit underscore star' -> 2).
					('letter symbol' -> 1)})