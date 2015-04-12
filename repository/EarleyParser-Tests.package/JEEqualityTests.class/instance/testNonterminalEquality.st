tests
testNonterminalEquality
	| one another |
	one := JENonterminal named: 'E'.
	another := JENonterminal named: 'E'.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash.
	self deny: (JENonterminal named: 'E') = (JETerminal for: #E).
	self deny: (JENonterminal named: 'E') hash = (JETerminal for: #E) hash