tests
testRuleAtNonterminal03
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
			(JENonterminal named: 'A') is_epsilon}.
	self assert: grammar rulesSize equals: 3.
	self
		should: [ grammar ruleAt: 'X' ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal X' ]