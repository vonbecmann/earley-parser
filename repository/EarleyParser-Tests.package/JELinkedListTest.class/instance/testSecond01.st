tests
testSecond01
	self
		should: [ list second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]