tests - derivation
testLeftmostDerivation01
	tree := grammar parseTree: 'e:t.'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll: {
					('vwg' -> 1).
					('rule list' -> 1).
					('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('empty' -> 1).
					('colon symbol' -> 1).
					('member list' -> 2).
					('member' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('empty' -> 1).
					('comma and member star' -> 2).
					('empty' -> 1).
					('dot symbol' -> 1).
					})