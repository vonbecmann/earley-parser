tests
testEquals
	| one another |
	one := JERule
		head: (JENonterminal named: 'T')
		body: 	{(JETerminal character: $-). (JENonterminal named: 'P')}.
	another := JEProductionRule
		head: (JENonterminal named: 'T')
		body: 	{(JETerminal character: $-). (JENonterminal named: 'P')}.
	self assert: (one equals: another)