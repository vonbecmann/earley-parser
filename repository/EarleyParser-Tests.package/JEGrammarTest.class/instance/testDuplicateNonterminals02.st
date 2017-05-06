tests
testDuplicateNonterminals02
	grammar := JEGrammar 
						productionRules: #(#('A' #('letter x symbol')) #('A' #('A'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar nonterminalsSize equals: 3