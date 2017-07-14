tests
testAcceptsMultiplyTermStartingAtTerm
	self assert: (grammar accepts: 'a*a' startingAt: 'T')