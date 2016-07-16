tests
testParse02
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree rightmostDerivation 
		equals:
			(grammar
				rulesAtAll:
					{('identifier' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 2).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('letter symbol' -> 1). })