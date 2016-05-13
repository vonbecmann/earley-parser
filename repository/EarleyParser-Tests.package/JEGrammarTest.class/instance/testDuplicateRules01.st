tests
testDuplicateRules01
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is_epsilon).
			((JENonterminal named: 'A') is_epsilon)}.
	self assert: grammar rulesSize equals: 2