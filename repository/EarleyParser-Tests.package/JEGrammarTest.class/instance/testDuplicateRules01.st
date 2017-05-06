tests
testDuplicateRules01
	grammar := JEGrammar 
						productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar rulesSize equals: 3