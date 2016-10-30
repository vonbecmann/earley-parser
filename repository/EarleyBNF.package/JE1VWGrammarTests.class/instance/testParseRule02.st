tests - rule
testParseRule02
	tree := self grammarStartingAt: 'rule' parseTree: 'e:e,plus symbol,t.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('alternative option' -> 1).
					('alternative' -> 2).
					('alternative' -> 2).					
					('alternative' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('comma symbol' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).					
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 1).
					('(space and small syntactic mark) plus' -> 1).
					('space plus' -> 1). ('space symbol' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('comma symbol' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('dot symbol' -> 1)})