tests
testRuleAtNonterminal03
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {(JENonterminal named: 'A')}}.
			 {(JENonterminal named: 'A'). {}}}.
	self assert: grammar rulesSize equals: 3.
	self
		should: [ grammar ruleAt: 'X'->1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal X' ]