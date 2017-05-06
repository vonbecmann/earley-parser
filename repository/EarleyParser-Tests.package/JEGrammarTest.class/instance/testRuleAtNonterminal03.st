tests
testRuleAtNonterminal03
	grammar := JEGrammar 
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar rulesSize equals: 5.
	self
		should: [ grammar ruleAt: 'A'->4 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown rule''s definition at index 4 for Nonterminal A' ]