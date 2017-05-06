tests
testDuplicateNonterminals01
	grammar := JEGrammar 
						productionRules: #(#('A' #()) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
	self assert: grammar nonterminalsSize equals: 3