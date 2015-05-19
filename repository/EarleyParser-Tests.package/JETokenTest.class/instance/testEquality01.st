tests
testEquality01
	| one another |
	one := JEToken this: $* matches: (JETerminal character: $*).
	another := JEToken this: $A matches: (JETerminal character: $A).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash