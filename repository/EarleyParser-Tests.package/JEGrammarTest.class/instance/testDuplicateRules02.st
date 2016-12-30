tests
testDuplicateRules02
	grammar := JEGrammar
		basedOn:
			{(JENonterminal named: 'A') -> {(JENonterminal named: 'A')}.
 			 (JENonterminal named: 'A') -> {(JENonterminal named: 'A')}}.
	self assert: grammar rulesSize equals: 2