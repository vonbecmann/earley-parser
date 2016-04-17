tests
testEquality02
	| rule one another |
	rule := (JENonterminal named: 'T')
		is: (JENonterminal named: 'T') , (JETerminal character: $+) , (JENonterminal named: 'P').
	one := JEHypernode value: (JESyntaxNode value: (rule dotAt: 2) start: 1 end: 4).
	another := JEHypernode value: (JESyntaxNode value: (rule dotAt: 2) start: 1 end: 4).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash