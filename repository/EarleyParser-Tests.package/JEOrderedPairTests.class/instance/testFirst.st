tests
testFirst
	| one |
	one := OrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil