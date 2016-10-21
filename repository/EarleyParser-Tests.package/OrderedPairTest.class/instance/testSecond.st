tests
testSecond
	| one |
	one := OrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'