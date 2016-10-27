tests
testParse01
	tree := grammar parseTree: '101'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('binary number' -> 1).
					('bit sequence' -> 2).
					('bit sequence' -> 2).
					('bit sequence' -> 1).
					('bit' -> 1).
					('one symbol' -> 1).
					('bit' -> 2).
					('zero symbol' -> 1).
					('bit' -> 1).
					('one symbol' -> 1)})