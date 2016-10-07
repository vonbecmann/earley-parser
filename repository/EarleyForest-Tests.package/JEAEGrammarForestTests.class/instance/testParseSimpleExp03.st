tests
testParseSimpleExp03
	self
		should: [ grammar parseForest: 'a+' ]
		raise: JEFailure
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 3.
				self
					assertCollection: failure expectedSymbols
					hasSameElements: {(JENonterminal named: 'T'). (JETerminal character: $a)} ]