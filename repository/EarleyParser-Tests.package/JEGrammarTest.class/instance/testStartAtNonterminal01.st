tests
testStartAtNonterminal01
	| grammarStartingAtB |
	grammar := JEGrammar 
						productionRules: #(#('A' #('B')) #('A' #()) #('A' #('letter x symbol')) #('B' #())) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
			
	self assert: grammar rulesSize equals: 6.
	grammarStartingAtB := grammar startAt: 'B'.
	self assert: grammarStartingAtB rulesSize equals: 6.
	self assert: grammarStartingAtB startRule body first equals: (JENonterminal named: 'B')