tests - derivation
testRightmostDerivation01
	tree := grammar parseTree: 'e:t.'.
	self
		assertCollection: tree rightmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('syntax' -> 1).
					('rule plus' -> 1).
					('rule plus' -> 2).
					('rule' -> 1).
					('definition list' -> 2).
					('comma symbol lexical element star' -> 2).
					('lexical element' -> 1).
					('nonterminal' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('nonterminal' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1)})