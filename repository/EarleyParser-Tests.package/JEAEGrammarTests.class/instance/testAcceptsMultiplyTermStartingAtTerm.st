tests
testAcceptsMultiplyTermStartingAtTerm
	self assert: ((grammar startAt: 'T') accepts: 'a*a')