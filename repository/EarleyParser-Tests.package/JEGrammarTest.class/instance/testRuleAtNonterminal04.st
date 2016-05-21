tests
testRuleAtNonterminal04
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
			(JENonterminal named: 'A') is_epsilon}.
	self assert: grammar rulesSize equals: 3.
	self
		should: [ grammar ruleAt: 'A'->4 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown rule''s definition at index 4 for Nonterminal A' ]