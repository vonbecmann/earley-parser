tests
testParseSimpleExp04
	self 
		should: [ grammar parseForest: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: [ :failure | self assert: failure position equals: 3 ]