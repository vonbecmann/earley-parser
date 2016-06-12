running
testParse01
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('identifier' -> 1).
					('letter symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 2)})