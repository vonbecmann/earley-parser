tests
testUnknownNonterminal01
	self
		should: [ JEGrammar basedOn: {((JENonterminal named: 'A') is: (JENonterminal named: 'B'))} ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal B in A = B.' ]