tests
testEmpty
	| one |
	one := JEIdentityOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil