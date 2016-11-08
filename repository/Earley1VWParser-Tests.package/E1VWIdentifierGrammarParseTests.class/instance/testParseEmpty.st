tests
testParseEmpty
	self
		should: [ grammar parse: '' ]
		raise: JEFailure
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 1.
				self 
					assertCollection: failure expectedSymbols 
					hasSameElements: {(JENonterminal named: 'identifier'). (JENonterminal named: 'letter symbol')} ]