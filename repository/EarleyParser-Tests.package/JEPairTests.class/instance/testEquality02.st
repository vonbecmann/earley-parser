tests
testEquality02
	| one another |
	one := JEPair first: 'A' second: 1.
	another := JEPair first: 'A' second: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another