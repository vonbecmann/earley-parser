tests
testDuplicateNonterminals01
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {}}.
			 {(JENonterminal named: 'A'). {}}}.
	self assert: grammar nonterminalsSize equals: 2