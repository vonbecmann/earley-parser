tests
testEquality
	| one another |
	one := IdentityOrderedPair first: 'A' second: 1.
	another := IdentityOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another