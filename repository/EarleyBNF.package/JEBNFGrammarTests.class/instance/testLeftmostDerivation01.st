tests - derivation
testLeftmostDerivation01
	tree := grammar parseTree: 'E:T.'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('syntax' -> 1).
					('rule plus' -> 1).
					('rule' -> 1).
					('nonterminal' -> 1).
					('letter symbol' -> 1).
					('letter digit underscore star' -> 2).
					('definition list' -> 2).
					('lexical element' -> 1).
					('nonterminal' -> 1).
					('letter symbol' -> 1).
					('letter digit underscore star' -> 2).
					('comma symbol lexical element star' -> 2).
					('rule plus' -> 2).})