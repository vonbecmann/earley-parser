tests
testDuplicateRules01
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {}}.
			 {(JENonterminal named: 'A'). {}}}.
	self assert: grammar rulesSize equals: 2