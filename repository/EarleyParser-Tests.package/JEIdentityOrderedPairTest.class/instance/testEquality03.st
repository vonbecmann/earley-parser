tests
testEquality03
	| one another |
	one := JEIdentityOrderedPair first: 'A' second: 1.
	another := JEIdentityOrderedPair first: 'B' second: 1.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another