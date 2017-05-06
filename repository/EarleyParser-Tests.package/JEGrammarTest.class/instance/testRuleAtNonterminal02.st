tests
testRuleAtNonterminal02
	grammar := JEGrammar 
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar rulesSize equals: 5.
	self
		should: [ grammar ruleAt: 'X' -> 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal X' ]