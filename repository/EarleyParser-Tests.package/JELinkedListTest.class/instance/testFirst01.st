tests
testFirst01
	self
		should: [ list first ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]