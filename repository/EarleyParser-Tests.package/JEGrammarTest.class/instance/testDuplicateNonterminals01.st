tests
testDuplicateNonterminals01
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is_epsilon).
			((JENonterminal named: 'A') is_epsilon)}.
	self assert: grammar nonterminalsSize equals: 2