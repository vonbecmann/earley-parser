tests
testDuplicateRules03
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JETerminal character: $B)).
			((JENonterminal named: 'A') is: (JETerminal character: $B))}.
	self assert: grammar rulesSize equals: 2