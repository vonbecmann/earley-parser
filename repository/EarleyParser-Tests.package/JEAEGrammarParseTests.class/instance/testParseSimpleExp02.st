tests
testParseSimpleExp02
	self 
		should: [ grammar parse: 'a ' ] 
		raise: JEFailure 
		withExceptionDo: [ :ex | self assert: ex position equals: 2 ]