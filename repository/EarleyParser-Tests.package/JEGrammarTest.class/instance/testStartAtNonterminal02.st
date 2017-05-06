tests
testStartAtNonterminal02
	grammar := JEGrammar 
						productionRules: #(#('A' #('B')) #('A' #()) #('A' #('letter x symbol')) #('B' #())) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.

	self assert: grammar rulesSize equals: 6.
	self 
		should: [ grammar startAt: 'Z' ] 
		raise: Error 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal Z' ]