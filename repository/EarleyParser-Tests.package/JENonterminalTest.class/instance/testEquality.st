tests
testEquality
	| one another |
	one := JENonterminal named: 'E'.
	another := JENonterminal named: 'E'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: (JENonterminal named: 'E') = (JETerminal character: $E).
	self deny: (JENonterminal named: 'E') hash = (JETerminal character: $E) hash