tests
testFirst
	| one |
	one := JEOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil