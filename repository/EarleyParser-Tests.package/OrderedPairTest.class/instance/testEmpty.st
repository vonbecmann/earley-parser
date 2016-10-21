tests
testEmpty
	| one |
	one := OrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil