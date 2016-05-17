tests
testEquality02
	| rule one another |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := JEHypernode model: (JESyntaxNode value: (rule dotAt: 2) start: 1 end: 4).
	another := JEHypernode model: (JESyntaxNode value: (rule dotAt: 2) start: 1 end: 4).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash