tests - derivation
testLeftmostDerivation01
	tree := grammar parseTree: 'e:t.'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll: {
					('one level vw grammar' -> 1).
					('rule list' -> 1).
					('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('alternative option' -> 1).
					('alternative' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('dot symbol' -> 1).
					})