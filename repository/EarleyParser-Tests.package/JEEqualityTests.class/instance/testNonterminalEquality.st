tests
testNonterminalEquality
	| one another |
	one := JENonterminal for: #E.
	another := JENonterminal for: #E.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash.
	self deny: (JENonterminal for: #E) = (JETerminal for: #E).
	self deny: (JENonterminal for: #E) hash = (JETerminal for: #E) hash