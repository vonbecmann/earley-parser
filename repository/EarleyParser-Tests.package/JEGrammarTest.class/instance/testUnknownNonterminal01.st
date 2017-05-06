tests
testUnknownNonterminal01
	self
		should: [ 
			grammar := JEGrammar
				productionRules: #(#('A' #('B')) #('A' #('letter x symbol')))
				representations: {('letter x symbol' -> (JETerminal character: $x))} ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal B in A: B.' ]