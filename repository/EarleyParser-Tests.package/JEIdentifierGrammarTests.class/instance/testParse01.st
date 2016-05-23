tests
testParse01
	| forest |
	forest := grammar parse: 'word_symbol'.
	self deny: forest isAmbiguous.
	self
		assertCollection:
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
					('word symbol star' -> 2)})
		equals: forest leftmostDerivation