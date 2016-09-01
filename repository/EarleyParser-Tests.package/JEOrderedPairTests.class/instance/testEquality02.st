tests
testEquality02
	| one another |
	one := OrderedPair first: 'A' second: 1.
	another := OrderedPair first: 'A' second: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another