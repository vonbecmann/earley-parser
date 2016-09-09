tests
testParseSimpleExp04
	self 
		should: [ grammar parse: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: [ :ex | self assert: ex position equals: 3 ]