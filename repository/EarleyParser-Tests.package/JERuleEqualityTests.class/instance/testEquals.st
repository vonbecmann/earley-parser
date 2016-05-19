tests
testEquals
	| one another |
	one := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	another := (JENonterminal named: 'T')
		is: (JENonterminal named: 'T') , (JETerminal character: $+) , (JENonterminal named: 'P').
	self assert: (one equals: another)