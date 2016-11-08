tests
testParse02
	self
		should: [ grammar parse: 'a!' ]
		raise: JEFailure
		withExceptionDo: 
			[ :failure | 
				self assert: failure position equals: 2.
				self 
					assertCollection: failure expectedSymbols 
					hasSameElements: {(JENonterminal named: 'word symbol'). (JENonterminal named: 'word symbol star')} ]