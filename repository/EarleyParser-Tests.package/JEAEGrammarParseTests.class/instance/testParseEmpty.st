tests - fail
testParseEmpty
	self
		should: [ grammar parse: '' ]
		raise: JEFailure
		withExceptionDo: [ :ex | self assert: ex position equals: 1 ]