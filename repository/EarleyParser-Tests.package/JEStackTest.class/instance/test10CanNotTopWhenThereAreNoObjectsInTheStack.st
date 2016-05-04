tests
test10CanNotTopWhenThereAreNoObjectsInTheStack
	self
		should: [ stack top ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]