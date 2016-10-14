tests - rule
testParseEpsilonRule01
	tree := self grammarStartingAt: 'rule' parseTree: 'exp:.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{
					('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('space and small syntactic mark plus option' -> 2).
					('empty' -> 1).
					('colon symbol' -> 1).
					('alternative option' -> 2).
					('empty' -> 1).
					('dot symbol' -> 1)})