tests - derivation
testLeftmostDerivation01
	tree := grammar parseTree: 'e:t.'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('vwg' -> 1).
					('rule' -> 1).
					('nonterminal' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('definition list' -> 2).
					('lexical element' -> 1).
					('nonterminal' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('comma symbol lexical element star' -> 2).})