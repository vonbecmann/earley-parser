tests-accessing
testAt
	self
		should: [ dict at: 'A' ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'key ''A'' not found' ]