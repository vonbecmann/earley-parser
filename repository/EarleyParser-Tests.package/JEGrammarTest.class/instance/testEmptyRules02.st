tests
testEmptyRules02
	self
		should: [ JEGrammar productionRules: #(#('A' ())) representations: #() ]
		raise: AssertionFailure
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'The collection of rules cannot be empty.' ]