tests
testEmpty
	| one |
	one := IdentityOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil