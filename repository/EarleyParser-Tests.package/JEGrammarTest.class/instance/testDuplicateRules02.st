tests
testDuplicateRules02
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
			((JENonterminal named: 'A') is: (JENonterminal named: 'A'))}.
	self assert: grammar rulesSize equals: 2