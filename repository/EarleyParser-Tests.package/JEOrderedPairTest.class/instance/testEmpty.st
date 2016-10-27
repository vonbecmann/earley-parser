tests
testEmpty
	| one |
	one := JEOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil