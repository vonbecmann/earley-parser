tests - failure
testParseSimpleExp04
	self 
		should: [ grammar parse: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 3.
				self 
					assertCollection: failure expectedSymbols
					hasSameElements: {(JENonterminal named: 'T'). (JETerminal character: $a)} ]