tests
testEquality
	| one another other |
	one := JEItemSet number: 1.
	another := JEItemSet number: 1.
	other := JEItemSet number: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash