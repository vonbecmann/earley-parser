tests
testParseSimpleExp04
	self 
		should: [ grammar parseForest: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: [ :ex | self assert: ex position equals: 3 ]