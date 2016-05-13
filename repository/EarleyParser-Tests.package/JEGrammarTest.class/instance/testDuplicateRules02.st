tests
testDuplicateRules02
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'B')).
			((JENonterminal named: 'A') is: (JENonterminal named: 'B'))}.
	self assert: grammar rulesSize equals: 2