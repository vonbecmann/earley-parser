tests
testDuplicateNonterminals02
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JETerminal character: $B)).
			((JENonterminal named: 'A') is: (JETerminal character: $C) , (JENonterminal named: 'A'))}.
	self assert: grammar nonterminalsSize equals: 2