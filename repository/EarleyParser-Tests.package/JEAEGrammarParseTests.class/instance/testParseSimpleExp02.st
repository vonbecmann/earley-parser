tests - failure
testParseSimpleExp02
	self 
		should: [ grammar parse: 'a ' ] 
		raise: JEFailure 
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 2.
				self 
					assertCollection: failure expectedSymbols  
					hasSameElements: {(JETerminal character: $*). (JETerminal character: $+).
											(JENonterminal named: 'star symbol'). 
											(JENonterminal named: 'plus symbol').} ]
				