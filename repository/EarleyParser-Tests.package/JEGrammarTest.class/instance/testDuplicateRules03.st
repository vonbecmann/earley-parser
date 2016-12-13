tests
testDuplicateRules03
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {(JETerminal character: $B)}}.
			 {(JENonterminal named: 'A'). {(JETerminal character: $B)}}}.
	self assert: grammar rulesSize equals: 2