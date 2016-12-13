tests
testDuplicateNonterminals02
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {(JETerminal character: $B)}}.
			 {(JENonterminal named: 'A'). {(JETerminal character: $C). (JENonterminal named: 'A')}}}.
	self assert: grammar nonterminalsSize equals: 2