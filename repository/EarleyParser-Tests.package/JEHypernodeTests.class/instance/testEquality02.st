tests
testEquality02
	| one another |
	one := JEHypernode model: 'start'.
	another := JEHypernode model: 'end'.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another