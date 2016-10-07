tests - failure
testParseSimpleExp06
	self 
		should: [ grammar parse: 'a*' ] 
		raise: JEFailure 
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 3.
				self 
					assertCollection: failure expectedSymbols
					hasSameElements: {(JENonterminal named: 'P'). (JETerminal character: $a)} ]