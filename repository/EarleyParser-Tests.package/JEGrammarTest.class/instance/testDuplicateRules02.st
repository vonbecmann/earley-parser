tests
testDuplicateRules02
	grammar := JEGrammar
						productionRules: #(#('A' #('A')) #('A' #('A')) #('A' #('letter x symbol')) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar rulesSize equals: 4