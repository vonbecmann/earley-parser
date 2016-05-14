tests
testEmptyRules01
	self
		should: [ JEGrammar basedOn: {} ]
		raise: AssertionFailure
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'The collection of rules cannot be empty.' ]