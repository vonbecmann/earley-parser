tests
testSecond
	| one |
	one := JEOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'